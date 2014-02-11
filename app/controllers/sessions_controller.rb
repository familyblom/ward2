class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "#{user.first_name}, welcome back"
      else
        flash.now.alert = "Right email, wrong password, chump."
        render :new
      end
    else
      flash.now.alert = "Nobody here with that email."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully"
  end


end
