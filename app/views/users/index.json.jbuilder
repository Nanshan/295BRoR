json.array!(@users) do |user|
  json.extract! user, :id, :message
  json.url user_url(user, format: :json)
end
