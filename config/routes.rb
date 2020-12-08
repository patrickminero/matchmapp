Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :matches, only: [:index, :show ] do
    resources :bars, only: [:index]
  end
  resources :bars, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
