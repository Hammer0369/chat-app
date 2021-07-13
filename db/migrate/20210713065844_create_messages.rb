class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :content # テキストの内容「content」カラム
      t.references :room, null: false, foreign_key: true # メッセージの投稿をしたチャットルームのid「room_id」カラム
      t.references :user, null: false, foreign_key: true # メッセージの投稿をしたユーザーのid「user_id」カラム
      t.timestamps
    end
  end
end