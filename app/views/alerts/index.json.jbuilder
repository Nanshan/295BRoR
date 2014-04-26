json.array!(@alert) do |place|
  json.extract! place, :name
end

