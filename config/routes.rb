Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :room_types
  resources :rooms
  resources :calendars
  resources :reservations, only: [ :index, :show, :create, :destroy ]
end
