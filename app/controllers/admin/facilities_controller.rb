class Admin::FacilitiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @facilities = Facility.all
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      flash[:facility_create] = "施設を追加しました"
      # 一覧へ遷移
      redirect_to admin_facility_path(@facility)
    else
      redirect_back fallback_location: root_path
    end
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    if @facility.update(facility_params)
      # 一覧へ遷移
      redirect_to admin_facility_path
      flash[:notice_update] = "施設情報を更新しました"
    else
      redirect_back fallback_location: root_path
    end
  end

  private
  def facility_params
    params.require(:facility).permit(:area_id, :name, :introduction, :price, :open, :holiday, :image, :address)
  end
end
