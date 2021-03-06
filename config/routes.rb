Rails.application.routes.draw do
namespace :admin do
  resources :orders do
    member do
      post :cancel
      post :ship
      post :shipped
      post :return
    end
  end
  resources :products do
    member do
      patch :move_up
      patch :move_down
    end
  end
end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
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
    post :apply_to_cancel
  end
end


namespace :account do
resources :orders
end
end
