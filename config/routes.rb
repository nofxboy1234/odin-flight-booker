Rails.application.routes.draw do
  resources :bookings
  resources :passengers
  resources :flights
  resources :airports
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'flights#index'
end
