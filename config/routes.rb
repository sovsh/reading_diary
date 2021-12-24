Rails.application.routes.draw do
  root 'home#index'
  resources :auth, only: [:create, :new, :destroy]
  resources :users do
    resources :books
  end
end
