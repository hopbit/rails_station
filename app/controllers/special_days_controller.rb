class SpecialDaysController < ApplicationController
  def index
    @special_days = SpecialDay.all
  end

  def show
    @special_day = SpecialDay.find(params[:id])
  end

  def new
    @special_day = SpecialDay.new
  end

  def create
    @special_day = SpecialDay.new(special_day_params)
    if @special_day.save
      redirect_to special_days_url
    else
      render :new
    end
  end

  private

  def special_day_params
    params.require(:special_day).permit(:name, :when)
  end
end
