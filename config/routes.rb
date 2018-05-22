Rails.application.routes.draw do
  resources :boats do
    resources :bookings, only: [:create, :new]
  end
  get 'dashboard_renter', to: 'pages#dashboard_renter', as: 'dashboard_renter'
  get 'dashboard_owner', to: 'pages#dashboard_owner', as: 'dashboard_owner'
  resources :bookings, only: [:index, :edit, :update, :destroy, :show]
  devise_for :users
  root to: 'pages#home'
end
