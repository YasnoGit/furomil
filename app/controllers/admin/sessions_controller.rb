# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # 管理者ログイン後、admin側施設一覧へ遷移
  def after_sign_in_path_for(resource)
    flash[:admin_sign_in] = "管理者ログインしました"
    admin_facilities_path
  end

  # 管理者ログアウト後、admin側ログイン画面へ遷移
  def after_sign_out_path_for(resource)
    flash[:admin_sign_out] = "管理者ログアウトしました"
    new_admin_session_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
