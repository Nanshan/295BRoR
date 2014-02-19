class AddDetailsToResturants < ActiveRecord::Migration
  def change
    add_column :resturants, :latitude, :string
    add_column :resturants, :logitude, :string
  end
end
