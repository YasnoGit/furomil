class Public::FacilitiesController < ApplicationController

  def index
    @areas = Area.all
    @facilities = Facility.all
  end

  def show
    @facility = Facility.find(params[:id])
    @areas = Area.all
  end

end
