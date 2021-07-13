class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #名前の入力が空の場合はDBに保存しない
  validates :name, presence: true
  # roomsテーブルと中間テーブルのアソシエーション
  has_many :room_users
  has_many :rooms, through: :room_users
end
