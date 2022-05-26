Rails.application.routes.draw do
  get 'diarys/index'
  root to: "diarys#index"
end
