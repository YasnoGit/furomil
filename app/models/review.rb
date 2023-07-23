class Review < ApplicationRecord

  # アソシエーション
  belongs_to :customer
  belongs_to :facility
  # バリデーション
  validates :comment, :score, presence: true

end
