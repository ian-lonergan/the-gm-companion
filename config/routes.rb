TheGmCompanion::Application.routes.draw do
  root 'campaigns#index'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/signup' => "users#new"
  get "/login" => "sessions#new"
  get "/logout" => "sessions#destroy"
  
  resources :campaigns, shallow: true do
    resources :campaign_objects
    resources :stories
    resources :characters
    resources :locations
    resources :notes
    resources :encounters
    resources :organizations
  end
  
  resources :campaign_objects, shallow: true do
    resources :notes
  end
  
  resources :campaign_objects, only: [:index, :create, :update, :destroy]
  resources :stories, only: [:index, :edit, :update, :destroy]
  resources :characters, only: [:index, :edit, :update, :destroy]
  resources :locations, only: [:index, :edit, :update, :destroy]
  resources :encounters, only: [:index, :edit, :update, :destroy]
  resources :organizations, only: [:index, :edit, :update, :destroy]
  resources :notes, only: [:index, :edit, :update, :destroy]
  
  resources :encounter_opponents do
    get :autocomplete_campaign_object_name, on: :collection
  end
  
  resources :organization_members do
    get :autocomplete_character_name, on: :collection
  end
end
