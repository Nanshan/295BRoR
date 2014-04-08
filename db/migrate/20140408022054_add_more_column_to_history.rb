class AddMoreColumnToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :dislike, :boolean
    add_column :histories, :placeID, :integer
    remove_column :histories, :latitude, :string
    remove_column :histories, :longitude, :string
  end
end
