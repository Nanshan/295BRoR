class RemoveCreatedAtFromResturants < ActiveRecord::Migration
  def change
     remove_column :resturants, :created_at, :datetime
  end
end
