Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/new'
  resources :users, only: :index
  resources :calendars
  resources :groups, only: [:index, :new, :create, :show]
  devise_for :users
end
