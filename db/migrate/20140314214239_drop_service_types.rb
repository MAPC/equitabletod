class DropServiceTypes < ActiveRecord::Migration
  def up
    drop_table :service_types
  end

  def down
    create_table :service_types do |t|
      t.string :mode
      t.string :slug

      t.timestamps
    end
  end
end
