require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do
    before do
      @room = FactoryBot.build(:room)
    end

    it 'nameの値が存在すれば登録できること' do
      expect(@room).to be_valid # チャットルームの情報が正しく保存されるか確認している。
    end

    it 'nameが空では登録できないこと' do
      # モデルファイルで設定したバリデーション（もしroomのネームが空だったらDBに保存されない）が正常に起動するかを確認している。
      @room.name = ''
      @room.valid?
      # もしDBに保存されない場合のエラーメッセージは「Name can't be blank（nameを入力してください）」となる。
      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
  end
end
