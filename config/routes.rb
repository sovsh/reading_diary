Rails.application.routes.draw do
  root 'home#index'
  resources :auth, only: [:create, :new, :destroy]
  resources :users do
    resources :books do
      resources :notes, only: [:create, :new]
      resources :quotes, only: [:create, :new]
    end
  end
end
