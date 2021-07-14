Rails.application.routes.draw do
  devise_for :users
  # 消してもいいみたい？→get 'messages/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  # roomsが親で、messagesが子という親子関係になるので、チャットルームに属しているメッセージという意味
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
