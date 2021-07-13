class Room < ApplicationRecord
  # usersテーブルと中間テーブルのアソシエーション
  has_many :room_users
  has_many :users, through: :room_users
end