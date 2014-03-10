class StationArea < ActiveRecord::Base
  attr_accessible :location,
                  :etod_score,
                  :station_name,
                  :transit_commute_share,
                  :transportation_ghgs,
                  :vehicle_miles_traveled,
                  :vehicle_ownership

  has_and_belongs_to_many :transit_lines

  def as_json(options={})
    super(options.merge( only: [ :id, :station_name, :location, :vehicle_miles_traveled ] ))
  end
end
