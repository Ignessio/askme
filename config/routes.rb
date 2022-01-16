Rails.application.routes.draw do
 root 'users#index'
 resources :users
 get 'show' => 'users#show'
end
