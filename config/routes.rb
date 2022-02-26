Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :questions, except: %i[show new index]
  resources :hashtags, only: %i[show create destroy]

  resources :questions do
    resources :taggings, only: %i[create destroy]
  end

  resources :hashtags do
    resources :taggings, only: %i[create destroy]
  end

  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'

end
