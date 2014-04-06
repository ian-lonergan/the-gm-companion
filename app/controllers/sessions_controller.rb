class SessionsController < ApplicationController  
  def create
    user = User.find_by(username: params[:session][:username])
    if (user && user.authenticate(params[:session][:password]))
      login user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end
    
  def destroy
    logout
    redirect_to root_url
  end
end