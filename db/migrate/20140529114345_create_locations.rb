class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.integer :zip
      t.string :address

      t.timestamps
    end
  end
end
