class SearchController < ApplicationController

  def search
  end

  def suggest
    # munis will be StationArea.pluck(:municipality).uniq
    render json: ({ station_names: StationArea.pluck(:station_name).uniq,
                    munis:       ["Ashland",
                                  "Bedford",
                                  "Boston",
                                  "Cambridge",
                                  "Canton",
                                  "Danvers",
                                  "Reading"] })
  end
end
