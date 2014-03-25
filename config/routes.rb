TheGmCompanion::Application.routes.draw do
  root 'campaign_objects#index'

  resources :campaign_objects, only: [:index, :create, :update, :destroy]
  resources :stories, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :characters, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :locations, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
