Rails.application.routes.draw do
  devise_for :users

  root to: 'home#home'
 

  resources :carts do
    collection do
      get '/cart', to: 'carts#show', as: 'cart'
      post 'add_to_cart/:product_id', action: 'add_to_cart', as: 'add_to_cart'
      delete 'remove_from_cart/:product_id', action: 'remove_from_cart', as: 'remove_from_cart'
      patch 'increase_quantity/:product_id', action: 'increase_quantity', as: 'increase_quantity'
      patch 'decrease_quantity/:product_id', action: 'decrease_quantity', as: 'decrease_quantity'
    end
  end
  

  
end
