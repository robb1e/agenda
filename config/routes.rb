Agenda::Application.routes.draw do

  root to: 'home#index'

  resources :plans

  # AUTHENTICATION
  # /auth/:provider is handled by Rack middleware in config/initializers/omniauth.rb
  match '/auth/:provider/callback', to: 'sessions#create', as: 'sessions_create'
  match "/logout", to: "sessions#destroy", as: 'sessions_destroy'
  
end
