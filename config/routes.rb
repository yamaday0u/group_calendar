Rails.application.routes.draw do
  root to: 'home#index'
  resources :calendars
  devise_for :users
end
