class StationAreasController < ApplicationController

  respond_to :html, :json

  def index
    respond_with(@station_areas = StationArea.all)
  end

  def show
    respond_with(@station_area = StationArea.find(params[:id]))
  end
end
