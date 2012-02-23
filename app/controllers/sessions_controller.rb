class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, :alert => 'Login failed, please check your email/password'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, :notice => 'You have been logged out'
  end
end
