class AddMoreDetailsToResturants < ActiveRecord::Migration
  def change
    add_column :resturants, :city, :string
    add_column :resturants, :state, :string
    add_column :resturants, :country, :string
    add_column :resturants, :zip, :string
    add_column :resturants, :phone, :string
    add_column :resturants, :price, :string
    add_column :resturants, :rating, :string
    add_column :resturants, :reviews, :string
    add_column :resturants, :category, :string
  end
end
