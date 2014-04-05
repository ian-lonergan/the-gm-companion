class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username])
    if (user && user.authenticate(params[:session][:password]))
      login user
      redirect_to root_url
    else
      render :new
    end
  end
  
  def login(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end
  
  def destroy
    logout
    redirect_to root_url
  end
  
  def logout
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
end