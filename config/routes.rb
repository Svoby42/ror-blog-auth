Rails.application.routes.draw do
  get 'static_pages/home'

  get   '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  get   '/logout',  to: 'sessions#destroy'

  get   '/signup',  to: 'users#new'

  resources :users

  root 'static_pages#home'

end
