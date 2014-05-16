class CreateDictionaryEntries < ActiveRecord::Migration
  def change
    create_table :dictionary_entries do |t|
      t.string :name
      t.string :code
      t.text :description
      t.text :importance
      t.text :interpretation
      t.text :technical_notes
      t.integer :order

      t.timestamps
    end
  end
end
