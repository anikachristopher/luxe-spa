Rails.application.routes.draw do
root "sessions#home"

get '/signup' => 'clients#new'
post '/signup' => 'clients#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'

delete '/logout' => 'sessions#destroy'

  resources :services
  resources :reviews
  resources :clients
  resources :appointments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
