class Public::SearchsController < ApplicationController
  # before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Facility"
      @facilities = Facility.looks(params[:search], params[:word])
    else
      @arias = Aria.looks(params[:search], params[:word])
    end
  end

end
