Rails.application.routes.draw do
=begin
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

  post '/books', to: 'books#create'
  get '/books', to: '/books#index'
  get 'books/:id', to: 'books#show'
  get 'books/new', to: '/books#new'

  post '/users/:user_id/books', to: 'books#create'
  get 'users/:user_id/books/new', to: 'books#new'
  get 'users/:user_id/books', to: 'books#index'
  get 'users/:user_id/books/:id', to: 'books#show'
  get 'users/:user_id/books/:id/edit', to: 'books#edit'
  put 'users/:user_id/books/:id', to: 'books#update'
  delete 'users/:user_id/books/:id', to: 'books#destroy'
=end
end
