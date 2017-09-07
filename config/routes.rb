Rails.application.routes.draw do
  resources :meetings
  root to: "meetings#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :meeting_rooms do
    get :available, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
