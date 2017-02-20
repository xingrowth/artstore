Rails.application.routes.draw do
    devise_for :users
    root 'products#index'

    namespace :admin do
        resources :products
    end

    resources :products do
        member do
            post :add_to_cart
        end
    end

    resources :carts

    resources :carts do
        collection do
            delete :clean
            post :checkout
        end
    end

    resources :cart_items

    resources :orders

    namespace :account do
      resources :orders
    end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
