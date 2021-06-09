Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:update, :edit]
  patch '/orders/:id', to: 'orders#update_status'
  get '/dashboard', to: 'dashboard#show'
end
