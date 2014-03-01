class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userId, :string
    add_column :users, :first_name, :string
    add_column :users, :middle_initial, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :gender, :string
    add_column :users, :phone, :string
    add_column :users, :email, :string
    add_column :users, :martial_status, :string
    add_column :users, :current_location, :string
    add_column :users, :hometown_city, :string
    add_column :users, :hometown_state, :string
    add_column :users, :hometown_country, :string
    add_column :users, :education_level, :string
    add_column :users, :profession, :string
    add_column :users, :employer, :string
    add_column :users, :past_employer_1, :string
    add_column :users, :has_kids, :string
    add_column :users, :number_of_kids, :string
    add_column :users, :number_of_tweets, :string
    add_column :users, :number_of_followers, :string
  end
end
