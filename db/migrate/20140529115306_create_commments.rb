class CreateCommments < ActiveRecord::Migration
  def change
    create_table :commments do |t|
      t.string :content
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :user_id

      t.timestamps
    end
  end
end
