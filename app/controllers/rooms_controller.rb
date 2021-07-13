class RoomsController < ApplicationController
  def new
    # form_withに渡す引数として、値が空のRoomインスタンスを@roomに代入
    @room = Room.new
  end

  def create
    # ルーム作成時の値をDBに保存できるようにしている
    @room = Room.new(room_params)
    # 保存の成功・失敗による条件分岐
    # 成功した場合はredirect_toメソッドでルートパスにリダイレクト
    if @room.save
      redirect_to root_path
    # 失敗した場合はrenderメソッドでrooms/new.html.erbのページを表示
    else
      render :new
    end
  end

  private
  # 配列として受け取ったデータを含むストロングパラメーターの定義
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
