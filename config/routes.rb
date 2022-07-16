Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  root 'application#hello'

  resources :tasks
  get '/signup', to: 'users#new'
  resources :users
end
