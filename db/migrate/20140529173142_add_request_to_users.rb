class AddRequestToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :request, :boolean
  end
end
