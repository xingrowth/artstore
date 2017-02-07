Rails.application.routes.draw do
  devise_for :users

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products
  end
  root 'products#index'

  resources :carts 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
