Rails.application.routes.draw do
  devise_for :users
  root to: "diarys#index"
  resources :users, only: [:edit, :update]
  resources :charts, only: [:index, :new, :create]
end
