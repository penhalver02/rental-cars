Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :manufacturers, only: [:show, :index, :create, :new, :destroy]
  resources :subsidiaries, only: [:show, :index, :create, :new, :edit, :update]
  resources :car_categories, only: [:show, :index, :create, :new, :edit, :update]
  resources :customers,  only: [:show, :index, :create, :new] do
    get 'search', on: :collection
  end
  resources :car_models, only: [:index, :show, :create, :new]
  resources :rentals, only: [:index, :new, :create, :show] do
    get 'search', on: :collection
    resources :car_rentals, only: [:new, :create]
  end
  resources :cars, only: [:index, :show, :new, :create]
end
