class Public::FacilitiesController < ApplicationController
  before_action :authenticate_customer!, if: :customer_signed_in?
  before_action :authenticate_admin!, if: :admin_signed_in?

  def index
    @areas = Area.all
    @facilities = Facility.all
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
