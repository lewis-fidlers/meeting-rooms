Rails.application.routes.draw do
  resources :meetings
  root to: "meetings#index"

  devise_for :users

  resources :meeting_rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
