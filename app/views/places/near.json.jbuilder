json.array!(@places) do |place|
  json.extract! place, :id, :name, :address, :city, :state,  :country, :zip, :phone, :price, :rating, :category
end

