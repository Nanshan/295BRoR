json.array!(@parks) do |park|
  json.extract! park, :name, :address, :city, :country, :zip, :phone, :price, :rating, :reviews, :latitude, :longitude, :parking
end
