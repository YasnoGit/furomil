class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # バリデーション
  validates :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, presence: true

  # 退会機能用
  def create
    super && (is_deleted == false)
  end

  # ゲストログイン用
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "ログイン"
      customer.first_name = "ゲスト"
      customer.last_name_kana = "ろぐいん"
      customer.first_name_kana = "げすと"
      customer.post_code = "0000000"
      customer.address = "ゲス都ゲスト市"
      customer.phone_number = "00000000000"
    end
  end

end
