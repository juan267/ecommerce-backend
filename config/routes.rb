# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resourcer :orders do
      resource :customer, controller: "orders/customer_details"
      resources :adjustments
      resources :payments, only: [:index, :new, :show, :create]
    end

    resources :products do
      resources :product_properties
      resources :variants, except: [:show]
      resources :prices, except: [:show]
    end
  end
end
