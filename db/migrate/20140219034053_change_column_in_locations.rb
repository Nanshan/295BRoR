class ChangeColumnInLocations < ActiveRecord::Migration
  def change
   rename_column :locations, :logitude, :longitude 
  end
end
