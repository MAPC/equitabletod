class SearchController < ApplicationController

  def search
  end

  def suggest
    # Add -- stations_classes: StationArea.pluck(:station_class).uniq,
    render json: ({ station_names: StationArea.pluck(:name).uniq,
                    etod_types:    StationArea.pluck(:etod_type).uniq,
                    munis:         StationArea.pluck(:muni_name).uniq.map(&:titleize) })
  end
end
