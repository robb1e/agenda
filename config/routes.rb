Agenda::Application.routes.draw do

  root to: 'home#index'

  resources :plans, only:[:create, :show] do
    member do
      get 'search'
    end
    resources :places, only: [:create]
    resources :picks, only: [:show, :update]
    resources :members, only: [:create, :index]
  end

  # AUTHENTICATION
  # /auth/:provider is handled by Rack middleware in config/initializers/omniauth.rb
  match '/auth/:provider/callback', to: 'sessions#create', as: 'sessions_create'
  match "/logout", to: "sessions#destroy", as: 'sessions_destroy'

end