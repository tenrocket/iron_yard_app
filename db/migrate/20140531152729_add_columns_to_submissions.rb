class AddColumnsToSubmissions < ActiveRecord::Migration
  def change
  	add_column :submissions, :reviewing, :boolean
  	add_column :submissions, :complete, :boolean
  end
end
