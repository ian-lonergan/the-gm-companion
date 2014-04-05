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
  end
  
  resources :campaign_objects, shallow: true do
    resources :notes
  end
  
  resources :campaign_objects, only: [:index, :create, :update, :destroy]
  resources :stories, only: [:index, :edit, :update, :destroy]
  resources :characters, only: [:index, :edit, :update, :destroy]
  resources :locations, only: [:index, :edit, :update, :destroy]
  resources :notes, only: [:index, :edit, :update, :destroy]
end
