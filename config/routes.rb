Rails.application.routes.draw do
  resources :receipts
  resources :items
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/pay/:id', to: 'pay#show'

  get '/maggie', to: 'home#maggie'
  get '/debug', to: 'home#debug'
  root to: "home#index"
end
