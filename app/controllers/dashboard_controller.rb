class DashboardController < ApplicationController
  def index
    @name = params[:name].upcase
  end
end
