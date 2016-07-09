class HomepageController < ApplicationController
  def index
    @curr_date = Time.current.strftime("%B %-d")
    @events = ['birthday','name day',"Mother's Day"]
  end
end
