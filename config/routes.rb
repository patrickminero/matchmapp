Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'bookings#dashboard'
  get '/bookings/:id/accepted', to: 'bookings#accepted', as: :accepted
  resources :bars do
    resources :reviews, only: :create
  end
  resources :matches, only: [:index, :show ] do
    resources :bars, only: [:index]
  end

  resources :profiles, only: [:show, :edit, :update]
  resources :bars, only: [:show] do
    resources :bookings, only: [:new, :create, :show, :update, :edit] do
      member do
        get :confirmation
      end
    end
  end
  resources :bookings, only: :destroy
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
