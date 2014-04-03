class RemoveTimeFromAtrractions < ActiveRecord::Migration
  def change
    remove_column :attractions, :created_at, :datetime
    remove_column :attractions, :updated_at, :datetime

  end
end
