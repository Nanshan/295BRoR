class AddDetailsToPlaces < ActiveRecord::Migration
  def change
      add_column :places, :locationType, :string
      add_column :places, :category, :string  
      add_column :places, :name, :string  
      add_column :places, :address, :string  
      add_column :places, :address2, :string  
      add_column :places, :city, :string  
      add_column :places, :state, :string  
      add_column :places, :zip, :integer 
      add_column :places, :country, :string  
      add_column :places, :phone, :string  
      add_column :places, :price, :integer  
      add_column :places, :rating, :decimal 
      add_column :places, :review, :text  
      add_column :places, :latitude, :decimal  
      add_column :places, :longitude, :decimal 
      add_column :places, :bbq, :boolean  
      add_column :places, :sport, :boolean  
      add_column :places, :restrooms, :boolean 
      add_column :places, :website, :string  
  end
end
