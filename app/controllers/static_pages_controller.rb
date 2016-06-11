class StaticPagesController < ApplicationController
  def index
    @date = Time.current.strftime("%B %-d")
    @events = ["birthday", "nameday", "Mother's Day"]
  end
end
