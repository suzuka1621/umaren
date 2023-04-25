Rails.application.routes.draw do
  devise_for :users
  root to: 'meets#index'
  resources :meets, only: :index
end