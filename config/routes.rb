Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :shipping
        post :shipped
        post :cancell
        post :cancelled
      end
    end
  end
  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :carts do
    collection do
      post :checkout
    end
  end
  resources :cart_items do
    member do
      post :add_quantity
      post :minus_quantity
    end
  end
  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
    end
  end
  namespace :account do
    resources :orders
  end

end
