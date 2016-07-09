class DashboardController < ApplicationController
  def index
    @name = params[:name].upcase
    @greeting_visible = @name.length > 4
  end
end
