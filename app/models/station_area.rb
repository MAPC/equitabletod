class StationArea < ActiveRecord::Base
  attr_accessible :name,
                  :etod_q0car,
                  :etod_q25k,
                  :etod_qabc,
                  :etod_qaff,
                  :etod_qdens,
                  :etod_qgrav,
                  :etod_qrent,
                  :etod_qtas,
                  :etod_qtci,
                  :etod_qwalk,
                  :etod_sub1t,
                  :etod_sub2o,
                  :etod_sub3d,
                  :etod_total,
                  :etod_type,
                  :transit_class


  has_and_belongs_to_many :transit_lines

  scope :by_name, -> name { where("name ~* ?", name) }
end
