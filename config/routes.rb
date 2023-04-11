Rails.application.routes.draw do
  root to: 'meets#index'
  resources :meets, only: :index
end