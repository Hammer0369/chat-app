class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image # MessagesテーブルとActive Storageのテーブルで管理された画像ファイルのアソシエーション。
  # 「content」カラムに、presence: trueを設けることで、空の場合はDBに保存しないというバリデーションを設定している。
  validates :content, presence: true
end
