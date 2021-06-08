Rails.application.routes.draw do
  get 'mate_chats/index'
  get 'mate_chats/create'
  root to: 'home#index'
  get 'home/new'

  # post 'rooms', to: 'site#index'
  # get 'rooms/:id', to: 'site#index'
  # get 'rooms', to: 'site#index'

  resources :calendars
  resources :groups do
    resources :chats, only: %i[index create]
    resources :calendar_for_groups do
      resources :group_calendar_chats, only: :create
    end
    resources :user_groups, only: %i[index create]
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_log_in', to: 'users/sessions#guest_log_in'
  end
  resources :users, only: %i[index show] do
    resources :relationships, only: %i[create destroy]
  end
  resources :rooms do
    resources :mate_chats, only: %i[index create]
  end
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      # resources :rooms, only: [:index, :create, :show]
    end
  end
end
