Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root to: 'home#index'
  resources :carriers, only: [:index, :show, :new, :create ,:edit, :update]
  resources :vehicles, only: [:new, :create]
  resources :prices, only: [:index]

  resources :carriers, only: [:show] do
    resources :vehicles, only: [:index, :show]
    resources :prices, only: [:new, :create]
    resources :deadlines, only: [:new, :create]
  end

  resources :orders, only: [:index, :new, :create]
end
