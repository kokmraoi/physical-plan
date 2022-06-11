Rails.application.routes.draw do
  devise_for :users
  get 'diarys/index'
  root to: "diarys#index"
  resources :users, only: [:edit, :update]
  resources :charts, only: [:new, :create]
end
