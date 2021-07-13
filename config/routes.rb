Rails.application.routes.draw do
  devise_for :users
  # 消してもいいみたい？→get 'messages/index'
  root to: "messages#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
end
