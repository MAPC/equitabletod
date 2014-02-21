class CreateStationAreas < ActiveRecord::Migration
  def change
    create_table :station_areas do |t|
      t.string :location
      t.string :station_name
      t.integer :etod_score
      t.decimal :vehicle_miles_traveled
      t.decimal :transit_commute_share
      t.decimal :vehicle_ownership
      t.decimal :transportation_ghgs

      t.timestamps
    end
  end
end
