Rails.application.routes.draw do

  root to: 'home#index'
  resources :calendars, only: :index
  devise_for :users

end
