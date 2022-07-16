Rails.application.routes.draw do
  resources :tasks
  root 'application#hello'
end
