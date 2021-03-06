Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :animals, only: [ :index, :new, :create ] do
    resources :bookings, only: :create
  end
  resources :animals, only: :show do
    resources :reviews, only: [ :new, :create ]
  end
  resources :bookings, only: [ :index, :update, :edit, :destroy ]
  namespace :owner do
    resources :bookings, only: [ :index, :update ]
    resources :animals, only: :index
  end
end
