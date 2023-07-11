class Facility < ApplicationRecord

  has_one_attached :image
  belongs_to :area
  has_many :reviews, dependent: :destroy

end
