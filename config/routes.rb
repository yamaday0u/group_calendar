Rails.application.routes.draw do
  get 'groups/index'
  root to: 'home#index'
  resources :calendars
  resources :groups, only: :index
  devise_for :users
end
