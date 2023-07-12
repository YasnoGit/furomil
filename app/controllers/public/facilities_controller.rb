class Public::FacilitiesController < ApplicationController

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

end
