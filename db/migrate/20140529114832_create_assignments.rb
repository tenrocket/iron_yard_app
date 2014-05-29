class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :description
      t.string :attachment
      t.boolean :complete
      t.boolean :reviewing
      t.date :due_date
      t.integer :user_id

      t.timestamps
    end
  end
end
