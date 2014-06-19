class AddTwoNewFieldsToStationAreas < ActiveRecord::Migration
  def change
  	add_column :station_areas, :ov_emppipe, :decimal
  	add_column :station_areas, :ex_emppipe, :decimal
  end
end
