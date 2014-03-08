class RemoveReviewFromResturant < ActiveRecord::Migration
  def change
     remove_column :resturants, :reviews, :string 
  end
end
