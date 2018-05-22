Rails.application.routes.draw do
  resources :boats do
    resources :bookings, only: [:create, :new]
  end
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources :bookings, only: [:index, :edit, :update, :destroy, :show]
  devise_for :users
  root to: 'pages#home'
end
