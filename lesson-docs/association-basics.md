# Associations: Adding Comments to Posts

## Step 1: Generate Model & Migration
`rails g model Comment author message:text post:belongs_to`

This creates a comment.rb, create_comments.rb migration

`rake db:migrate` to run the migration
We can see the new changes in our `db/schema.rb`

## Step 2: Tell our posts about our Comments relation

``` ruby 
  # app/models/posts.rb
  ...
    has_many :comments
  ...
```
At this point, our comments know about our Post, and our Posts know about our comments.
It's time to try it all out in Rails Console:

```
post = Post.last
post.comments
#=> []
# Looks up the comments on the post, we can see it in the sql statement

# When we do this, it automatically fills out the post_id field on our comment
new_comment = post.comments.create(author: 'Jack', message: 'This is our first comment')
#=> #<Comment id: 10, message: "This is our first comment", author: "Jack", post_id: 10, created_at: "2014-02-01 00:02:36", updated_at: "2014-02-01 00:02:36">

# The alternative would be
Comment.create(author: "Jill", message: "Demo Comment", post_id: post.id ) 
# This will raise a mass-assignment error because :post_id is not in our Comments attr_accessible list

# We can look up the owner (post) of a comment by calling:

new_comment.post

# and it will return the post.
```

### Now our association is all setup. We need to get this working in our app now.

## Step 3: Build a new feature that allows us post comments on a single post's page.

.Clearly, this a big task, let's break it down into smaller tasks (pseudocode), let's look at our existing code for creating posts, etc. for some guidance:

### Feature: Comment on an individual post
1.)  We need a Comment Form on the post page

We can look at our app/views/posts/_form for guidance
Format that posts/form to fit our comments needs

``` 
  # app/views/posts/show.html.erb
  # ....
  <h3> Add a comment</h3>
  <%= render 'posts/comment_form' %>
  # ....
```
``` 
  # app/views/posts/_comment_form
  <%= form_for(@comment, url: post_comments_path(@post)) do |f| %>
    <% if @comment.errors.any? %>
      <div id="error_explanation">
        <h2><%= pluralize(@comment.errors.count, "error") %> prohibited this post from being saved:</h2>

        <ul>
        <% @comment.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
        </ul>
      </div>
    <% end %>

    <div class="field">
      <%= f.label :author %><br />
      <%= f.text_field :author %>
    </div>
    <div class="field">
      <%= f.label :message %><br />
      <%= f.text_area :message %>
    </div>
    <div class="actions">
      <%= f.submit %>
    </div>
  <% end %>
```

* Change all instances of @post to @comment
* Remove unnecessary/irrelevant code
* Alter the :body fields to use :message for our comments

error message: `undefined method `model_name' for NilClass:Class`
@comment doesn't exist yet

2.) Add @comment to our `posts#show` action

We need to set @comment up in our `posts#show` action, similar to how it was working for posts in our new action 
```
  # app/controllers/posts_controller.rb
  # ...
  @comment = @post.comments.new`
  # ...
```

At this point we get an error saying `undefined method 'comments_path' for #<#<Class:0x007f840baa8ac0>:0x007f840bab3c68>`

No comments_path exists. Our `form_for(@comments)` is inferring that the url should be `comments_path` since we did not pass a url in explicitly. 

3.)  Make a create_comment route in our routes, a place to post our form to.
``` ruby
  # config/routes.rb
  resources :posts do
    post 'comments', to: "posts#create_comment", as: :comments
  end
```
```
  rake routes

  # => post_comments POST   /posts/:post_id/comments(.:format) posts#create_comment
```
We get this lovely route, that includes our :post_id, which we'll use in our create_comment action on the posts controller to look up the post by its id

4.) Add the url to our form_for(@comment)

We then need to pass this URL into our new comment form
```
  form_for(@comment, url: post_comments_path(@post)) #.....
```

Now our form is rendering on the page, we try and post and get an error saying, no action create_comments in our posts controller, which brings us to the last step. 

5.) Create a create_comments action in our posts controller

Create create_comments action in our posts controller. We'll model this after our posts#new action, copy and paste from our create action
``` ruby
# app/controllers/posts_controller.rb
  # Before

  def create_comment
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # We need to set the @post to lookup from the params[:post_id]
  # We need to set the new @comment to create off of `@post.comments.new` (just like in the show action), and pass in the form parameters as `params[:comment]`

  # Then try and save the @comment, rather than the @post
  # Update your success notice,  notice: 'Comment was successfully added.' 
  # and render the "show" action, instead of the "new" action, as that's where all this started
  
  # After

  def create_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully added.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "show" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
```

And we're done.
