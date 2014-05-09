class TransitLine < ActiveRecord::Base
  attr_accessible :name,
                  :service_type
  
  has_and_belongs_to_many :station_areas
  # belongs_to :service_type

  def full_name
    "#{name} #{service_type_title}"
  end

  def service_type_title
    self.service_type.title
  end
end
