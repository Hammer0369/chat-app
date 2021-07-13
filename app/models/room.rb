class Room < ApplicationRecord
  # usersテーブルと中間テーブルのアソシエーション
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
  # 「ルーム名が存在（presence）している場合のみ作成可（true）」というバリデーション
  validates :name, presence: true
end