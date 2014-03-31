json.array!(@parks) do |park|
  json.extract! park, :name, :address, :city, :state,  :country, :zip, :phone, :price, :rating, :reviews, :parking, :category
end
