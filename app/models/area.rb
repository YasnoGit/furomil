class Area < ApplicationRecord

  has_many :facility, dependent: :destroy
  validates :name, presence: true

end
