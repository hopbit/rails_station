class SpecialDaysController < ApplicationController
  def index
    @special_days = SpecialDay.all
  end

  def show
    @special_day = SpecialDay.find(params[:id])
  end
end
