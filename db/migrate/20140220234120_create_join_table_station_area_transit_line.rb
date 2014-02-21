class CreateJoinTableStationAreaTransitLine < ActiveRecord::Migration
  def change
    create_table :station_areas_transit_lines do |t|
      t.belongs_to :station_area
      t.belongs_to :transit_line
    end
  end
end
