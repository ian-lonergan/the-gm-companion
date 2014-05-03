TheGmCompanion::Application.routes.draw do
  root 'campaigns#index'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/signup' => "users#new"
  get "/login" => "sessions#new"
  get "/logout" => "sessions#destroy"
  
  resources :campaigns, shallow: true do
    resources :stories
    resources :characters
    resources :locations
    resources :notes
    resources :encounters
    resources :organizations
  end
  
  resources :stories, shallow: true do
    resources :notes
  end
  resources :characters, shallow: true do
    resources :notes
  end
  resources :locations, shallow: true do
    resources :notes
  end
  resources :notes, shallow: true do
    resources :notes
  end
  resources :encounters, shallow: true do
    resources :notes
  end
  resources :organizations, shallow: true do
    resources :notes
  end
  
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
  
  scope '/admin' do
    resources :invitations, only: [:index, :create]
  end
end
