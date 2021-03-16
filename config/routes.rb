Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/new'
  resources :calendars
  resources :groups, only: [:index, :new, :create, :show] do
    resources :chats, only: [:index, :create]
    resources :calendar_for_groups
    resources :user_groups, only: :create
  end
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  resources :users, only: [:index, :show]
end
