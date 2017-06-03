Rails.application.routes.draw do
  devise_for :users

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  namespace :admin do
    resources :products do
      member do
         patch :move_up
         patch :move_down
      end
    end
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  namespace :account do
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
    end
    collection do
      get :search
    end
    #增加search
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
