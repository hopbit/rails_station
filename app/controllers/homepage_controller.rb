class HomepageController < ApplicationController
  def index
    @curr_date = Time.current.strftime("%B %-d")
    @events = ['birthday','nameday',"Mother's Day"]
  end
end
