class UsersController < ApplicationController

  def edit
  end

  def update
    # userの更新情報が保存できたときroot（チャット画面）にリダイレクト
    if current_user.update(user_params)# ストロングパラメーター
      redirect_to root_path
    # userの更新情報が保存できなかったときedit(編集画面)のビューを表示
    else
      render :edit
    end
  end

  private

  def user_params
    # 「name」と「email」の編集を許可
    params.require(:user).permit(:name, :email)
  end
end
