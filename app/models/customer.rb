class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # validates :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, presence: true

  # 退会機能用
  def create
    super && (is_deleted == false)
  end

end
