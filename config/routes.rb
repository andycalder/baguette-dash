Rails.application.routes.draw do
  devise_for :users
  root to: 'meals#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:update, :edit]
  get '/dashboard', to: 'dashboard#show'
end
