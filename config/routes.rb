Rails.application.routes.draw do
  resources :comments
  resources :favorite_lists
  devise_for :users

  root 'products#index'

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
      post :add_quantity
      post :reduce_quantity
    end

    collection do
      get :search
    end

    put :favorite, on: :member
    resources :favorite_lists

    resources :comments
  end

  resources :categories

  resources :carts do
    collection do
      delete :clean
      get :checkout
    end
  end

  resources :cart_items do
    member do
      post :add_quantity
    end
  end

  resources :orders
end
