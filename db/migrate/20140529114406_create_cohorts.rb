class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :season
      t.string :course
      t.integer :location_id

      t.timestamps
    end
  end
end
