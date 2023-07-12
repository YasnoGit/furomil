class Facility < ApplicationRecord

  has_one_attached :image
  belongs_to :area
  has_many :reviews, dependent: :destroy

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @facility = Facility.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @facility = Facility.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @facility = Facility.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @facility = Facility.where("name LIKE?","%#{word}%")
    else
      @facility = Facility.all
    end
  end

end
