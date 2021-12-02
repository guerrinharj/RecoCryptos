Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cryptos, only: [:index, :show, :update] do
    resources :likes, only: [:create]
  end
  resources :likes, only: [:destroy]
  resources :users, only: [:index, :show]
  get '/ranking', to: "users#index", as: :ranking
  get '/wallet', to: "pages#wallet", as: :wallet
end
