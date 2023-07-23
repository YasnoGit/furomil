class Public::HomesController < ApplicationController
  def top
    # ランキング機能用
    # @ranks=Facility.find(Review.group(:facility_id).order('avg(score) desc').pluck(:post_id))
  end

  def about
  end

  # ゲストログイン用
  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "ログイン"
      customer.first_name = "ゲスト"
      customer.last_name_kana = "ろぐいん"
      customer.first_name_kana = "げすと"
      customer.post_code = "0000000"
      customer.address = "ゲス都ゲスト市"
      customer.phone_number = "00000000000"
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストログインしました。'
  end

end
