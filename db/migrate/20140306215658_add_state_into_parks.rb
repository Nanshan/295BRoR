class AddStateIntoParks < ActiveRecord::Migration
  def change
    add_column :parks :state, :string
  end
end
