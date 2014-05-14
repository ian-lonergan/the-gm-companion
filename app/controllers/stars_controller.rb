class StarsController < ApplicationController
  before_action :logged_in_user
  
  respond_to :html, :js
  
  def create
    starred_item_class = params[:target]
    item = starred_item_class.singularize.classify.constantize.find(params[:id])
    current_user.star!(item)
    respond_with item
  end
  
  def destroy
    starred_item_class = params[:target]
    item = starred_item_class.singularize.classify.constantize.find(params[:id])
    current_user.unstar!(item)
    respond_with item
  end
end