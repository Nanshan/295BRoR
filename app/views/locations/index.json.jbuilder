json.array!(@locations) do |location|
  json.extract! location, :userID, :latitude, :longitude, :created_at
  json.url location_url(location, format: :json)
end
