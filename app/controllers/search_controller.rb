class SearchController < ApplicationController

  def search
  end

  def suggest
    # munis will be StationArea.pluck(:municipality).uniq
    render json: ({ station_names: StationArea.pluck(:name).uniq,
                    etod_types: StationArea.pluck(:etod_type).uniq,
                    stations_classes: StationArea.pluck(:station_class).uniq,
                    munis:       ["Ashland",
                                  "Bedford",
                                  "Boston",
                                  "Cambridge",
                                  "Canton",
                                  "Danvers",
                                  "Reading"] })
  end
end
