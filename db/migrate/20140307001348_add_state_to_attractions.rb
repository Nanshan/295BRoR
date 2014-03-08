class AddStateToAttractions < ActiveRecord::Migration
  def change
     add_column :attractions, :state, :string
  end
end
