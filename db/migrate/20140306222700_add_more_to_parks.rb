class AddMoreToParks < ActiveRecord::Migration
  def change
    add_column :parks, :category, :string
    add_column :parks, :bbq, :string
    add_column :parks, :sport, :string
  
  end
end
