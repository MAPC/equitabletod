class CreateStationAreas < ActiveRecord::Migration

def change

 create_table :station_areas do |t|
      t.string :name
      t.string :DK_STATNAM
      
      t.string :location

      t.integer :etod_q0car
      t.integer :etod_q25k
      t.integer :etod_qabc
      t.integer :etod_qaff
      t.integer :etod_qdens
      t.integer :etod_qgrav
      t.integer :etod_qrent
      t.integer :etod_qtas
      t.integer :etod_qtci
      t.integer :etod_qwalk
      t.integer :etod_sub1t
      t.integer :etod_sub2o
      t.integer :etod_sub3d
      t.integer :etod_total
      t.string :etod_type
      
      t.string :station_class

      t.timestamps
    end
  end
end




