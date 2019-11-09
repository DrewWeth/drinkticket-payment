Rails.application.routes.draw do
  resources :groups
  resources :receipts
  resources :items
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/pay/:id', to: 'pay#show'

  get '/maggie', to: 'home#maggie'
  get '/debug', to: 'home#debug'
  get '/confirm/:id', to: 'items#confirm'
  root to: "home#index"
end
