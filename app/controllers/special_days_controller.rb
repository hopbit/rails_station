class SpecialDaysController < ApplicationController
  def index
    @events = SpecialDay.all
  end
end