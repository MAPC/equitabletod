class CreateTransitLines < ActiveRecord::Migration
  def change
    create_table :transit_lines do |t|
      t.string :name
      t.belongs_to :service_type

      t.timestamps
    end
  end
end
