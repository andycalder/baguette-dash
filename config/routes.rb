Rails.application.routes.draw do
  get 'meals/index'
  get 'meals/show'
  get 'meals/new'
  get 'meals/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:update]
  get '/dashboard', to: 'dashboard#show'
end
