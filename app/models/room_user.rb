class RoomUser < ApplicationRecord
  # usersテーブルとroomsテーブルのアソシエーション
  belongs_to :room
  belongs_to :user
end