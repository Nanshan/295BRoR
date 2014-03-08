class Removeidfromresturants < ActiveRecord::Migration
  def change
     remove_column :resturants, :id, :INTEGER
  end
end
