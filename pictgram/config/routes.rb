Rails.application.routes.draw do
  
  get 'comments/create'
  get 'comments/destroy'
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 
  resources :users
  resources :topics
    resources :comments
   
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  post '/destroy', to: 'favorites#destroy'
  
  
end