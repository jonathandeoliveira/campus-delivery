Rails.application.routes.draw do
  root to: 'home#index'
  resources :carriers, only: [:index, :show, :new, :create ,:edit, :update]
  resources :vehicles, only: [:index, :show, :new, :create]
  resources :prices, only: [:index]
end
