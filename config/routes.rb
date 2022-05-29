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
    resources :orders, only:[:show]
    patch 'activate', on: :member
    patch 'desactivate', on: :member
  end

  resources :orders, only: [:index, :new, :create,:update] do
    patch 'deny', on: :member
    patch 'accept', on: :member
    patch 'in_transit', on: :member
    patch 'delivered', on: :member
    resources :delivery_updates, only: [:show, :create]
    get 'search', on: :collection
  end

 

end
