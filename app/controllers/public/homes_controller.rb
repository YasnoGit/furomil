class Public::HomesController < ApplicationController
  def top
    # ランキング機能用
    # @ranks=Facility.find(Review.group(:facility_id).order('avg(score) desc').pluck(:post_id))
  end

  def about
  end

end
