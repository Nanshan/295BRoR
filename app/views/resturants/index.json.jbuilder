json.array!(@resturants) do |resturant|
  json.extract! resturant, :name, :address, :city, :state, :country, :zip, :phone, :rating, :category
end
