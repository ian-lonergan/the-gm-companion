class NotesController < ApplicationController
  def index
    if params[:campaign_id]
      @notes = Campaign.find(params[:campaign_id]).notes
    else
      @notes = Note.all
    end
  end
  
  def new
    @note = Note.new
    @campaign_object = CampaignObject.find(params[:campaign_object_id])
  end
  
  def create
    @note = Note.create(note_params)
    @note.campaign_object = CampaignObject.find(params[:campaign_object_id]) if params[:campaign_object_id]
    @note.save
    if @note.campaign_object
      redirect_to(@note.campaign_object.campaign_object_holder)
    else
      redirect_to(Campaign.find(params[:campaign_id]))
    end
  end
  
  def show
    @note = Note.find(params[:id])
    @campaign_object = @note.campaign_object
  end
  
  def edit
    @note = Note.find(params[:id])
    @campaign_object = @note.campaign_object
  end
  
  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      redirect_to(@note.campaign_object.campaign_object_holder)
    else
      redirect_to(@note.campaign_object.campaign_object_holder)
    end
  end
  
  def destroy
    @deleted = Note.find(params[:id]).destroy
  end
  
  def note_params
    params.require(:note).permit(:text, :campaign_object_id)
  end
  
end
