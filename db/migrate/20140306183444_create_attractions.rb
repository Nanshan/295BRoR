class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :zip
      t.string :phone
      t.string :price
      t.string :rating
      t.string :reviews
      t.string :latitude
      t.string :longitude
      t.string :category
      t.string :parking

      t.timestamps
    end
  end
end
