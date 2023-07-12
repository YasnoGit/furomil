class Public::ReviewsController < ApplicationController

  def create
    facility = Facility.find(params[:facility_id])
    review = current_customer.reviews.new(review_params)
    review.facility_id = facility.id
    # review = facility.reviews.build(review_params) #buildでcommentとfacility_idを同時代入
    # review.customer_id = current_customer.id
    review.save
    redirect_to facility_path(facility)
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to facility_path(params[:facility_id])
  end

  private

  def review_params
    params.require(:review).permit(:comment, :score)
  end

end