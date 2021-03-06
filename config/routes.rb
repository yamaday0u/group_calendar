Rails.application.routes.draw do
  root to: 'home#index'
  resources :calendars, only: [:index, :new, :create]
  devise_for :users
end
