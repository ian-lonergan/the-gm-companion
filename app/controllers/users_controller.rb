class UsersController < ApplicationController
  before_action :logged_in_user, only: [:update, :edit, :destroy]
  before_action :correct_user, only: [:update, :edit, :destroy]

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :campaigns
    else
      render :new
    end
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
