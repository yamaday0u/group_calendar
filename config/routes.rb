Rails.application.routes.draw do

  root to: "calendars#index"
  resources :calendars, only: :index
  devise_for :users

end
