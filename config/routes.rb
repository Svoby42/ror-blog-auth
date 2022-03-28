Rails.application.routes.draw do

  get   '/home',    to: 'static_pages#home'

  get   '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  get   '/logout',  to: 'sessions#destroy'

  get   '/signup',  to: 'users#new'
  get   '/profile', to: 'users#show'

  resources :users
  resources :articles

  root 'static_pages#home'

end
