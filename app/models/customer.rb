class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy

  # validates :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, presence: true

  def create
    super && (is_deleted == false)
  end

end
