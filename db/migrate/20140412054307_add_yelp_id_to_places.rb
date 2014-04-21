class AddYelpIdToPlaces < ActiveRecord::Migration
  def change
     add_column :places, :yelpId, :string
  end
end
