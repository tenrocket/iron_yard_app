class RemoveColumnsFromAssignmentTable < ActiveRecord::Migration
  def change
  	remove_column :assignments, :reviewing
  	remove_column :assignments, :complete
  end
end
