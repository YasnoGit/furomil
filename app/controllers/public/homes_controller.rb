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
      customer.last_name = SecureRandom.urlsafe_base64
      customer.first_name = SecureRandom.urlsafe_base64
      customer.last_name_kana = SecureRandom.urlsafe_base64
      customer.first_name_kana = SecureRandom.urlsafe_base64
      customer.post_code = SecureRandom.urlsafe_base64
      customer.address = SecureRandom.urlsafe_base64
      customer.phone_number = SecureRandom.urlsafe_base64
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストログインしました。'
  end

end
