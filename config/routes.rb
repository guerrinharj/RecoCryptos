Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cryptos, only: [:index, :show, :update]
  resources :users, only: [:index, :show] do
    member do
      get :wallet
    end
  end
  get '/ranking', to: "users#index", as: :ranking

end
