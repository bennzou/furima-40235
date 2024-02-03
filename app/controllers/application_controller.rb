class ApplicationController < ActionController::Base

  # deviseコントローラー時に下記メソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  private

  end

  # 新規登録時、emailとencrypted_password以外もストロングパラメーターとして許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date ])
  end