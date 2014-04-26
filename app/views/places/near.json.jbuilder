json.array!(@places) do |place|
  json.extract! place, :name, :address, :city, :state,  :country, :zip, :phone, :price, :rating, :category
end

