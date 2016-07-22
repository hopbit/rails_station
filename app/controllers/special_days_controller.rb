class SpecialDaysController < ApplicationController

  def index
    @events = SpecialDay.all
  end

  def show
    @special_day = SpecialDay.find(params[:id])
  end

  def new
    @special_day = SpecialDay.new
  end

  def create
    special_day_hash = params[:special_day]
    name_str = special_day_hash[:name]
    when_date = special_day_hash[:when] 
    if SpecialDay.create!(name: name_str, when: when_date)
      redirect_to special_days_path
    else
      render :new
    end
  end
end