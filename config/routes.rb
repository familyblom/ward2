MySite::Application.routes.draw do

  resources :surveys

  resources :projects


  resources :users

  get '/contact-me', to: "contact_me#new", as: :contact_me
  post '/contact-me', to: "contact_me#create", as: :create_contact_me

  get "/sign-up", to: "users#new", as: :sign_up
  get "/sign-in", to: "sessions#new", as: :sign_in
  post "/sign-in", to: "sessions#create", as: :create_session
  delete "/sign-out", to: "sessions#destroy", as: :sign_out
  # get | post | put | patch | delete

  # get "/url-path", to: "controller#action", as: :url_path_name
  root to: "static_pages#home"
  resources :posts do
    post 'comments', to: "posts#create_comment", as: :comments
    delete 'comments/:comment_id', to: "posts#destroy_comment", as: :destroy_comment
  end

  # resources :posts, except: [:index, :show]
  # get '/posts', to: 'posts#index', as: :posts
  # get '/posts/:id', to: "posts#show", as: :post
  # get '/posts/new', to: "posts#new", as: :new_post
  # get '/posts/:id/edit', to: "posts#edit", as: :edit_post
  # post '/posts', to: 'posts#create', as: :posts
  # put '/posts/:id', to: "posts#update", as: :post
  # delete '/posts/:id', to: "posts#destroy", as: :post
  # post '/posts/:post_id/comments', to: "posts#create_comment", as: :comments

  get "/gallery", to: "static_pages#gallery", as: :gallery
  get "/about-me", to: "static_pages#about_me", as: :about_me

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
