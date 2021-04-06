Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/new'
  resources :calendars
  resources :groups do
    resources :chats, only: %i[index create]
    resources :calendar_for_groups
    resources :user_groups, only: [:index, :create]
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[index show] do
    resources :relationships, only: %i[create destroy]
  end
end
