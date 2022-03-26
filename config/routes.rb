Rails.application.routes.draw do

  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
