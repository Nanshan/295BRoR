json.array!(@attractions) do |attraction|
  json.extract! attraction, :name, :address, :city, :state,  :country, :zip, :phone, :price, :rating, :reviews, :latitude, :longitude, :category, :parking
end
