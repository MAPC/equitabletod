class CreateTransitLines < ActiveRecord::Migration
  def change
    create_table :transit_lines do |t|
      t.string :name
      t.string :service_type
      t.string :mapc_code

      t.timestamps
    end
  end
end
