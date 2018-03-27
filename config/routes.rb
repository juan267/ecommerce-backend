# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :products do
      resources :product_properties
      resources :variants, except: [:show]
      resources :prices, except: [:show]
      # Penser rutas para imagenes
    end
  end
end
