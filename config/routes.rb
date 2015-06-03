Rails.application.routes.draw do
  resources :users
  
  root 'static_pages#index'
  
  get '/auth/twitter/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"  
  
end
