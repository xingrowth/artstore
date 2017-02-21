Rails.application.routes.draw do
  root 'products#index'
  namespace :admin do
    resources :products
    resources :orders
  end
  devise_for :users
  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end
  resources :cart_items
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end
  namespace :account do
    resources :orders
  end
end
