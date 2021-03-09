Rails.application.routes.draw do
  get 'groups/index'
  root to: 'home#index'
  resources :users, only: :index
  resources :calendars
  resources :groups, only: [:index, :new, :create, :show]
  deevise_for :users
end
