Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get 'items/orders' , to:'orders#index'
  resources :items do
    resources :orders
  end
end
