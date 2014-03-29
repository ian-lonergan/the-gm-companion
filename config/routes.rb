TheGmCompanion::Application.routes.draw do
  root 'campaigns#index'

  resources :campaigns, shallow: true do
    resources :campaign_objects
    resources :stories
    resources :characters
    resources :locations
  end
  resources :campaign_objects, only: [:index, :create, :update, :destroy]
  resources :stories, only: [:index, :edit, :update, :destroy]
  resources :characters, only: [:index, :edit, :update, :destroy]
  resources :locations, only: [:index, :edit, :update, :destroy]
end
