class AddUserIdToLocations < ActiveRecord::Migration
  def change
     add_column :locations, :userID, :string
  end
end
