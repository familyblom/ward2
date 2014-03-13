class StaticPagesController < ApplicationController
  def home
    @posts = Post.featured
    @post = Post.featured.first
  end

  def about_me
    @ip_info = Geolocate.find(request.ip)
  end

  def gallery
  end
end
