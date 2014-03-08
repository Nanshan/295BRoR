class RemoveStateFromLocations < ActiveRecord::Migration
  def change
     remove_column :locations, :state,  :string
  end
end
