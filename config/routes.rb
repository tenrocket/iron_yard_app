Rails.application.routes.draw do
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"

  get "admin" => "admin#index"

  resources :locations
  resources :cohorts
  resources :assignments
  resources :submissions
  resources :users
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]

  root 'home#index'

end