json.array!(@attractions) do |attraction|
  json.extract! attraction, :name, :address, :city, :state,  :country, :zip, :phone, :price, :rating, :reviews, :parking, :category
end
