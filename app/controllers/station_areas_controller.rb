class StationAreasController < ApplicationController

after_filter :cors_set_access_control_headers

# For all responses in this controller, return the CORS access control headers.

  respond_to :html, :json

  def index
    respond_with(@station_areas = StationArea.all)
  end

  def show
    respond_with(@station_area = StationArea.find(params[:id]))
  end
end

private

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end
