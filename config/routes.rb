TheGmCompanion::Application.routes.draw do
  root 'campaigns#index'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/signup' => "users#new"
  get "/login" => "sessions#new"
  get "/logout" => "sessions#destroy"
  
  resources :campaigns, shallow: true do
    resources :stories do
      get 'tags/:tag', to: 'stories#tags', on: :collection, as: 'tag'
    end
    resources :characters do
      get 'tags/:tag', to: 'characters#tags', on: :collection, as: 'tag'
    end
    resources :locations do
      get 'tags/:tag', to: 'locations#tags', on: :collection, as: 'tag'
    end
    resources :notes
    resources :encounters do
      get 'tags/:tag', to: 'encounters#tags', on: :collection, as: 'tag'
    end
    resources :organizations do
      get 'tags/:tag', to: 'organizations#tags', on: :collection, as: 'tag'
    end
  end
  
  resources :campaign_objects, shallow: true do
    resources :notes
    get :autocomplete_name, on: :collection
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
