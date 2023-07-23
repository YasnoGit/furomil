class Facility < ApplicationRecord

  # 画像保持
  has_one_attached :image
  # アソシエーション
  belongs_to :area
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # バリデーション
  validates :image, :area_id, :name, :introduction, :price, :open, :holiday, :address, presence: true

  # G_Map軽度緯度取得用
  geocoded_by :address
  after_validation :geocode

  # ブックマーク新既確認
  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

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
