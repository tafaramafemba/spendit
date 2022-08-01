Rails.application.routes.draw do
  devise_for :users
    resources :categories, only: [:index, :new, :show, :create, :destroy]
    resources :transactions, only: [:index, :new, :show, :create, :destroy]
end
