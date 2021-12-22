Rails.application.routes.draw do
  root 'home#index'

  post '/auth', to: 'auth#create'
  get '/auth/new', to: 'auth#new'
  delete '/auth/:id', to: 'auth#destroy'

  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  resources :users do
    resources :books
  end
end
