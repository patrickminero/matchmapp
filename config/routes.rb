Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :bars do
    resources :reviews, only: :create
  end
  resources :matches, only: [:index, :show ] do
    resources :bars, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
