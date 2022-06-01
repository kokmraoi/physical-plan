Rails.application.routes.draw do
  devise_for :users
  get 'diarys/index'
  root to: "diarys#index"
end
