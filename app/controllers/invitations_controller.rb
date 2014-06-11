class InvitationsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  
  def index
    @invitations = Invitation.paginate(per_page: 25, page: params[:page])
  end
  
  def create
    @invitation = Invitation.create(key: SecureRandom.base64(6))
  end
  
  private
    def admin_user
      unless current_user.is_admin?
        flash[:error] = 'You don\'t have access to do this.'
        redirect_back_or root_url
      end
    end
end