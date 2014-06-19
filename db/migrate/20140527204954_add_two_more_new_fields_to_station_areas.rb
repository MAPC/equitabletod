class AddTwoMoreNewFieldsToStationAreas < ActiveRecord::Migration
  def change
  	add_column :station_areas, :ov_hupipe, :decimal
  	add_column :station_areas, :ex_hupipe, :decimal
  end
end
