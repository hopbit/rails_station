class SpecialDaysController < ApplicationController

  def index
    @events = SpecialDay.all
  end

  def show
    @special_day = SpecialDay.find(params[:id])
  end

end