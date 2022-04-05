Rails.application.routes.draw do

  resources :topics
  resources :articles

  root 'static_pages#home'
  get   '/home',    to: 'static_pages#home'
  get   '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  get   '/logout',  to: 'sessions#destroy'
  get   '/signup',  to: 'users#new'
  get   '/profile', to: 'users#show'
  get   '/profile/edit', to: 'users#edit', as: :edit_profile
  patch '/profile/edit', to: 'users#update', as: :update_profile
  post  '/users/:id', to: 'users#destroy', as: :delete_user

  get "/404", to: "errors#not_found", as: :not_found
  get "/500", to: "errors#internal_error", as: :internal_error

  post '/articles/new', to: 'articles#create'

  resources :users

  get   '/:topic_id', to: 'topics#show'
  get   '/:topic_id/new', to: 'articles#new', as: :new_topic_article
  get   '/:topic_id/:article_id', to: 'articles#show', as: :show_article
  get   '/:topic_id/:article_id/edit', to: 'articles#edit', as: :edit_topic_article

  #get '*unmatched_route', to: 'errors#not_found'
end
