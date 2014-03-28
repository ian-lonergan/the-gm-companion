TheGmCompanion::Application.routes.draw do
  root 'campaigns#index'

  resources :campaigns, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :campaign_objects, only: [:index, :create, :update, :destroy]
    resources :stories, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :characters, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :locations, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  resources :campaign_objects, only: [:index, :create, :update, :destroy]
  resources :stories, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :characters, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :locations, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
