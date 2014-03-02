json.array!(@users) do |user|
  json.extract! user, :userId, :first_name, :middle_initial, :last_name, :date_of_birth, :gender, :phone, :email, :martial_status, :current_location, :hometown_city, :hometown_state, :hometown_country, :education_level, :profession, :employer, :past_employer_1, :has_kids, :number_of_kids, :number_of_tweets, :number_of_followers
 # json.url user_url(user, format: :json)
end
