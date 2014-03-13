class StationArea < ActiveRecord::Base
  attr_accessible :location,
                  :etod_score,
                  :station_name,
                  :transit_commute_share,
                  :transportation_ghgs,
                  :vehicle_miles_traveled,
                  :vehicle_ownership

  has_and_belongs_to_many :transit_lines

  scope :by_name, -> name { where("station_name LIKE ?", "%#{name}%") }
end
