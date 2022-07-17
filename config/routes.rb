Rails.application.routes.draw do
  root 'sessions#new'

  post 'tasks/:id/toggle', to: 'tasks#toggle'
  resources :tasks

  get '/signup', to: 'users#new'
  post '/user/update', to: 'users#update_from_project'
  resources :users

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  resources :sessions, only: %i(new create destroy)

  resources :comments, only: %i(create)

  post 'list/update', to: 'lists#update_from_project'
  resources :lists

  resources :projects, only: %i(index create show)
end
