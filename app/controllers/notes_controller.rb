class NotesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_user, only: [:new, :create, :update, :edit, :destroy]
  
  def create
    @note = Note.new(note_params)
    @note.campaign_object = CampaignObject.find(params[:campaign_object_id]) if params[:campaign_object_id]
    @note.save
  end
  
  def update
    @note = Note.find(params[:id])
  end
  
  def destroy
    @note = Note.find(params[:id]).destroy
  end
  
  def note_params
    params.require(:note).permit(:text)
  end
  
  private
    def correct_user
      item = current_user.notes.find_by(id: params[:id])
      item ||= current_user.campaign_objects.find_by(id: params[:campaign_object_id])
      if item.nil?
        flash[:error] = 'You don\'t have access to do this.'
        redirect_back_or :back
      end
    end
end
