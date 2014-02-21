class CreateServiceTypes < ActiveRecord::Migration
  def change
    create_table :service_types do |t|
      t.string :mode
      t.string :slug

      t.timestamps
    end
  end
end
