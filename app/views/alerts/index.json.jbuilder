json.array!(@alert) do |place|
  json.extract! place, :id, :name
end

