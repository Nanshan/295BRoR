class ChangeColumnInResturants < ActiveRecord::Migration
  def change
    rename_column :resturants, :logitude, :longitude
  end
end
