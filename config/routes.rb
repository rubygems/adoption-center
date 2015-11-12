Rails.application.routes.draw do

  root 'site#index'

  # Authentication
  get '/auth/:provider/callback'   => 'sessions#create', as: :omniauth_callback
  get '/signout' => 'sessions#destroy', as: :sign_out
  get '/search' => 'site#search_gems', as: :search

  # Resources
  resources :gems, only: [:index, :show]
  resources :gems_adoptions, except: :edit
  resources :adoption_requests, only: [:index, :new, :create]
  resources :gem_ownership_transfers, only: :index
end
