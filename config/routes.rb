Rails.application.routes.draw do
  resources :bookings
  devise_for :users
  root to: 'pages#home'
  resources :tools
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
