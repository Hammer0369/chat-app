class ApplicationController < ActionController::Base
  # before_actionで呼び出すことで、アクションを実行する前にログインしていなければログイン画面に遷移
  before_action :authenticate_user!
  # configure_permitted_parameters（←deviseでの追加カラム設定を行うメソッド）
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # permit(:アクション, キー: [:追加したいカラム])
  end
end
