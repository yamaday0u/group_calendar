Rails.application.routes.draw do
  # root_path(Top-page)
  root to: 'home#index'

  # get to Coming-soon-page
  get 'home/new'

  # path for calendar actions
  resources :calendars

  # path for admin/calendars actions
  namespace :admin do
    resources :calendars, only: %i[index]
  end

  # path for group actions
  resources :groups do
    # path for group_chat actions
    resources :chats, only: %i[index create]

    # path for calendar_for_groups actions
    resources :calendar_for_groups do
      # path for  group_calendar_chats actions
      resources :group_calendar_chats, only: :create
    end

    # path for user_groups actions
    resources :user_groups, only: %i[index create]
  end

  # path for devise actions
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  # path for guest_log_in
  devise_scope :user do
    post 'users/guest_log_in', to: 'users/sessions#guest_log_in'
  end

  # path for showing user(s)
  resources :users, only: %i[index show] do
    # path for relationship actions
    resources :relationships, only: %i[create destroy]
  end

  # path for mate_chat actions
  resources :rooms do
    resources :mate_chats, only: %i[index create]
  end

  # path for devise_token_auth in order to implement Single Page Application
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
