class Admin::AreasController < ApplicationController
  before_action :authenticate_admin!

  def index
    @area = Area.new
    @areas = Area.page(params[:page]).per(6)
  end

  def create
    @area = Area.new(area_params)
    if @area.save
      flash[:area_create] = "エリアを追加しました"
      redirect_to admin_areas_path
    else
      redirect_back fallback_location: root_path
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      redirect_to admin_areas_path
      flash[:notice_update] = "エリア情報を更新しました"
    else
      render "edit"
    end
  end

  private

  def area_params
    params.require(:area).permit(:name)
  end

end
