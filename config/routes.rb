Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/new'
  resources :calendars
  resources :groups, only: %i[index new create show] do
    resources :chats, only: %i[index create]
    resources :calendar_for_groups
    resources :user_groups, only: :create
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[index show] do
    resources :relationships, only: :create
  end
end
