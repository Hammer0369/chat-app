class Room < ApplicationRecord
  # usersテーブルとroomsテーブルのアソシエーション
  belongs_to :room
  belongs_to :user
end