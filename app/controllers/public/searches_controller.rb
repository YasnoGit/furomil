class Public::SearchesController < ApplicationController
  # before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "Facility"
      @facilities = Facility.looks(params[:search], params[:word])
    else
      # エリアテーブルから検索ワードでデータ取得　例：東京等
      @areas = Area.looks(params[:search], params[:word])
      # 上記結果からid(東京はid=1など)を使用してfacilityテーブル(area_id)から該当データを取得、where使用
      @facilities = Facility.where(area_id: @areas)
    end
    # 検索結果画面へ遷移
    render 'public/facilities/search_result'
  end

end
