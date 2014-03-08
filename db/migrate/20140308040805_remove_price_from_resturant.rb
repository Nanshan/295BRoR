class RemovePriceFromResturant < ActiveRecord::Migration
  def change
     remove_column :resturants, :price, :string
  end
end
