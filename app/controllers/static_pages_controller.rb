class StaticPagesController < ApplicationController
  def home
    @posts = Post.featured
    @post = Post.featured.first
  end

  def about_me
  end

  def gallery
  end
end
