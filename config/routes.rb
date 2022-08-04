Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  
  resources :users do
    resources :categories do
      resources :payments, only: [:index, :new, :show, :create, :destroy]
    end
    
  end
end
