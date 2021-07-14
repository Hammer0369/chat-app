class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image # MessagesテーブルとActive Storageのテーブルで管理された画像ファイルのアソシエーション。
  # 「content」カラムに、presence: trueを設けることで、空の場合はDBに保存しないというバリデーションを設定している。
  # validatesのunlessオプションにメソッド名を指定することで、「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件
  validates :content, presence: true, unless: :was_attached?
  # was_attached?メソッドは、self.image.attached?という記述によって、画像があればtrue、なければfalseを返す
  def was_attached?
    self.image.attached?
  end
end
