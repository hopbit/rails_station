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
    puts "--> special_day_hash: #{special_day_hash}" # debug
    if special_day_hash[:name] != nil && special_day_hash[:when] != nil
      when_date = DateTime.parse(special_day_hash[:when])
      puts "> when_date: #{when_date}"
      SpecialDay.create!(name: special_day_hash[:name], when: when_date)
    end
  end
end