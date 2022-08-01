Rails.application.routes.draw do
  root :to => 'categories#index'
  devise_for :users
  
  resources :users do
    resources :categories, only: [:index, :new, :show, :create, :destroy]
    resources :payments, only: [:index, :new, :show, :create, :destroy]
  end
end
