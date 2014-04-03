class RemoveTimeFromParks < ActiveRecord::Migration
  def change
    remove_column :parks, :created_at, :datetime
    remove_column :parks, :updated_at, :datetime
  end
end
