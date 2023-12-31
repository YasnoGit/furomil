class Area < ApplicationRecord

  # アソシエーション
  has_many :facility, dependent: :destroy
  # バリデーション
  validates :name, length: { minimum: 2, maximum: 4 }, presence: true

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @area = Area.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @area = Area.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @area = Area.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @area = Area.where("name LIKE?","%#{word}%")
    else
      @area = Area.all
    end
  end

end
