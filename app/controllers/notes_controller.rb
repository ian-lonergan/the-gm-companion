class NotesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_note_owner, only: [:update, :edit, :destroy]
  before_action :correct_campaign_object_owner, only: [:new, :create]  
  
  def create
    @note = Note.new(note_params)
    @note.campaign_object = CampaignObject.find(params[:campaign_object_id]) if params[:campaign_object_id]
    @note.save
  end
  
  def index
    if params[:campaign_id]
      @notes = Campaign.find(params[:campaign_id]).notes.paginate(per_page: 25, page: params[:page])
    else
      @notes = Note.all
    end
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
    def correct_note_owner
      note = current_user.notes.find_by(id: params[:id])
      if note.nil?
        flash[:error] = 'You don\'t have access to do this.'
        redirect_back_or :back
      end
    end
    
    def correct_campaign_object_owner
      campaign_object = current_user.campaign_objects.find_by(id: params[:campaign_object_id])
      if campaign_object.nil?
        flash[:error] = 'You don\'t have access to do this.'
        redirect_back_or :back
      end
    end
end
