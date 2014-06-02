class RenameCommentsTable < ActiveRecord::Migration
  def change
  	rename_table :commments, :comments
  end
end
