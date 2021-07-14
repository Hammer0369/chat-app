class MessagesController < ApplicationController
  def index
    # @messageには、Message.newで生成した、Messageモデルのインスタンス情報を代入
    # @roomには、paramsに含まれているroom_idを代入
    @message = Message.new
    @room = Room.find(params[:room_id]) # チャットルームに関する情報
    # チャットルームに紐付いている全てのメッセージ（@room.messages）
    @messages = @room.messages.includes(:user) # N+1問題をincludesメソッドで解消→ユーザー情報を1度のアクセスでまとめて取得
  end

  def create
    # @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出し
    # 生成したインスタンスを@messageに代入し、saveメソッドでメッセージの内容をmessagesテーブルに保存
    @room = Room.find(params[:room_id]) # チャットルームに関する情報
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    # パラメーターの中に、ログインしているユーザーのidと紐付いている、メッセージの内容contentを受け取れるように許可
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end