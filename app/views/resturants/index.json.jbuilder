json.array!(@resturants) do |resturant|
  json.extract! resturant, :name, :address
  #json.url resturant_url(resturant, format: :json)
end
