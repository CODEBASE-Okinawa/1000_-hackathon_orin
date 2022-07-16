Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'application#hello'

  resources :tasks

  get '/signup', to: 'users#new'
  resources :users

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  resources :sessions, only: %i(new create destroy)
end
