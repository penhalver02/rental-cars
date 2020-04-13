Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :manufacturers, only: [:show, :index, :create, :new]
  resources :subsidiaries, only: [:show, :index, :create, :new, :edit, :update]
  resources :car_categories, only: [:show, :index, :create, :new]
  resources :customers,  only: [:show, :index, :create, :new]
end
