# 中間テーブル（どのユーザーがどのチャットルームに参加しているかを管理）
class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      # 「usersテーブル」と「roomsテーブル」の情報を参照
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
