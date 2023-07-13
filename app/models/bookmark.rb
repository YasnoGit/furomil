class Bookmark < ApplicationRecord

  # アソシエーション
  belongs_to :customer
  belongs_to :facility

  # 重複防止
  validates :customer_id, uniqueness: { scope: :facility_id }

end
