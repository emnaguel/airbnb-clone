Rails.application.routes.draw do
  resources :boats do
    resources :bookings, only: [:create, :new]
  end
  get 'owner_dashboard', to: 'pages#owner_dashboard'
  get 'client_dashboard', to: 'pages#client_dashboard'
  resources :bookings, only: [:index, :edit, :update, :destroy, :show]
  devise_for :users
  root to: 'pages#home'
end
