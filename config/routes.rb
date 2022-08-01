Rails.application.routes.draw do
    resources :categories, only: [:index, :new, :show, :create, :destroy]
    resources :transactions, only: [:index, :new, :show, :create, :destroy]
end
