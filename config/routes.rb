Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :questions, only: %i[create edit update destroy]
  resources :hashtags, only: [:show]

  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
end
