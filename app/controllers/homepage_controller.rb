class HomepageController < ApplicationController
  def index
    @curr_date = Time.current.strftime("%B %-d")
  end
end
