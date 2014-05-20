class AddNewFieldToStationAreas < ActiveRecord::Migration
  def change
  	add_column :station_areas, :line_descr, :string
  end
end
