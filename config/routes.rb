Rails.application.routes.draw do
  resources :transactions
  resources :groups
  resources :items
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  get '/maggie', to: 'home#maggie'
  get '/debug', to: 'home#debug'
  
  get '/pay/:id', to: 'pay#show'
  get '/checkout/:id', to: 'pay#show'

  post '/pay/:id', to: 'pay#handlePayment'
  post '/checkout/:id', to: 'pay#handlePayment'

  get '/confirm/:id', to: 'items#confirm'
  
  root to: "home#index"
end
