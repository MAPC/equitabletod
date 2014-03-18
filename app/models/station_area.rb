class StationArea < ActiveRecord::Base

  has_and_belongs_to_many :transit_lines

  def location
    "#{self.latitude} #{self.longitude}"
  end

  # Basic Search

  scope :by_name, -> name { where("station_areas.name ~* ?", name) }
  # scope :by_muni, -> muni { where("muni ~* ?", muni) }
  scope :by_line, -> line { includes(:transit_lines).where("transit_lines.name ~* ?", line) }
  
  scope :by_service, -> service_type {
    includes(:transit_lines).where("transit_lines.service_type ~* ?", service_type) }
  
  # TODO: once database is fixed, attr in quotes will be station_type
  scope :by_station_type, -> station_type { where("station_class ~* ?", station_type) }

  scope :by_etod_category, -> etod_category { where("etod_type ~* ?", etod_category) }

  # Advanced Search

  MIN_RENT = 0 ; MAX_RENT = 10
  scope :by_rent, -> min, max { where("etod_qrent >= ? AND etod_qrent <= ?", min || MIN_RENT, max || MAX_RENT) }

end
