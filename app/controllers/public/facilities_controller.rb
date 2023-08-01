class Public::FacilitiesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @areas = Area.all
    #ページネーション
    @facilities = Facility.page(params[:page]).per(8)
  end

  def show
    @facility = Facility.find(params[:id])
    @areas = Area.all
    @review = Review.new
    @reviews = @facility.reviews
  end

  def rank
    # ランキング機能用
    @facilities = Facility.
      left_joins(:reviews).
      distinct.
      sort_by do |facility|
        ranking = facility.reviews
        if ranking.present?
          ranking.map(&:score).sum / ranking.size
        else
          0
        end
      end.
      reverse
  end

end
