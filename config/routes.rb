Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
root 'before_index#index'
resources :welcome
resources :products do
  member do
    post :add_to_cart
  end
  collection do
    get :bouquet
    get :box_flower
    get :ceremony
    get :micro
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
      post :apply_to_cancel
    end
  end
  namespace :account do
    resources :orders
  end
  resources :contact
  resources :about
  resources :news
end
