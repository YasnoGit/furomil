class Public::BookmarksController < ApplicationController
  before_action :authenticate_customer!, if: :customer_signed_in?

  # 下記遷移設定(redirect_to)は非同期通信用にコメントアウト

  def create
    @facility = Facility.find(params[:facility_id])
    bookmark = @facility.bookmarks.build(customer_id: current_customer.id)
    if bookmark.save
      # redirect_to request.referer
    else
      # redirect_to request.referer
    end
  end

  def destroy
    @facility = Facility.find(params[:facility_id])
    bookmark = @facility.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
      bookmark.destroy
      # redirect_to request.referer
    else
      # redirect_to request.referer
    end
  end

end
