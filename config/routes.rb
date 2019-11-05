Rails.application.routes.draw do
  resources :items
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/pay/:id', to: 'pay#show'

  get '/maggie', to: 'home#maggie'
  root to: "home#index"
end
