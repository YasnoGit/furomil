class Public::CustomersController < ApplicationController
  # before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def destroy
  end

  def updates
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      # 編集完了後会員詳細へ遷移
      redirect_to customer_path
    else
      # 編集保存失敗の場合は編集ページへ遷移
      render 'edit'
    end
  end

  def warning
  end

  def withdrawal
    @customer = Customer.find(current_customer.id)
    #is_deletedカラムフラグ
    @customer.update(is_deleted: true)
    #ログアウト→退会
    reset_session
    flash[:notice] = "退会処理完了"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_deleted)
  end

end
