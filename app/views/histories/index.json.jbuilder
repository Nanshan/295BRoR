json.array!(@histories) do |history|
  json.extract! history, :id, :userId, :latitude, :longitude, :like
  json.url history_url(history, format: :json)
end
