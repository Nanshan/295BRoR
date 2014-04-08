json.array!(@logins) do |login|
  json.extract! login, :id, :userName, :email, :password
  json.url login_url(login, format: :json)
end
