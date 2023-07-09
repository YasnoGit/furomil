# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :customer_state, only: [:create]退会機能？

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました"
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    root_path
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

  # protected退会機能？→

  # def customer_state
  #   @customer = Customer.find_by(email: params[:customer][:email])
  #   return if !@customer
  #   if (@customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true))
  #     flash[:notice] = "ログインしようとしたユーザーは退会済みです。再度新規登録を行ってください。"
  #     redirect_to new_customer_registration_path
  #   end
  # end退会機能？←

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
