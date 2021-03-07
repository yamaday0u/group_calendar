Rails.application.routes.draw do
  root to: 'home#index'
  resources :calendars
  resources :groups, only: :index
  devise_for :users
end
