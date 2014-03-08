class RemoveTimeFromResturants < ActiveRecord::Migration
  def change
    remove_column :resturants, :created_at, :datetime
    remove_column :resturants, :updated_at, :datetime
  end
end
