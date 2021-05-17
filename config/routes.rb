Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/new'
  resources :calendars
  resources :groups do
    resources :chats, only: %i[index create]
    resources :calendar_for_groups
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
  namespace :api do
    namespace :v1 do
      resources :rooms, only: :index
    end
  end
end
