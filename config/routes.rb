Rails.application.routes.draw do
  resources :users
  
  root 'staticpages#index'
  
  get '/auth/twitter/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"  
  
end
