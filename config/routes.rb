Rails.application.routes.draw do

get '/signup' => 'clients#new'
post '/signup' => 'clients#create'

  resources :services
  resources :reviews
  resources :clients
  resources :appointments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
