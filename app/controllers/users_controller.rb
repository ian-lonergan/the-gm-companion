class UsersController < ApplicationController
  before_action :logged_in_user, only: [:update, :edit, :destroy]
  before_action :correct_user, only: [:update, :edit, :destroy]

  def create
    @user = User.new(user_params)
    @user.invitation = Invitation.find_by(key: params[:invitation][:key], user_id: nil)
    if (@user.save)
      redirect_to @user
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
