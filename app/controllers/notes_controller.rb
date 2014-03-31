class NotesController < ApplicationController
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
  
end
