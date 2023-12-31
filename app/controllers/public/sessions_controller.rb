# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  # 論理削除(退会)機能用
  before_action :customer_state, only: [:create]

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました"
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    root_path
  end
  
  # ゲストログイン用
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストログインしました。'
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

  protected
  
  # 論理削除(退会)機能用
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
    if (@customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true))
      flash[:reregistration] = "ログインユーザーは退会済みです。再度新規登録を行ってください。"
      redirect_to new_customer_registration_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
