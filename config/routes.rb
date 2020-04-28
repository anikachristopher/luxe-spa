Rails.application.routes.draw do
root "sessions#home"

get '/signup' => 'clients#new'
post '/signup' => 'clients#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'

delete '/logout' => 'sessions#destroy'

get '/auth/google_oauth2/callback' => 'sessions#google'


resources :appointments, only: [:new, :create, :index, :show]

resources :services, only: [:index, :show]

resources :clients do
  resources :clients, only: [:new, :create, :index]
end

  resources :reviews
  #resources :clients
  #resources :appointments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
