# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140301184059) do

  create_table "histories", force: true do |t|
    t.string   "userId"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "like"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "userID"
  end

  create_table "resturants", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "userId"
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "date_of_birth"
    t.string   "gender"
    t.string   "phone"
    t.string   "email"
    t.string   "martial_status"
    t.string   "current_location"
    t.string   "hometown_city"
    t.string   "hometown_state"
    t.string   "hometown_country"
    t.string   "education_level"
    t.string   "profession"
    t.string   "employer"
    t.string   "past_employer_1"
    t.string   "has_kids"
    t.string   "number_of_kids"
    t.string   "number_of_tweets"
    t.string   "number_of_followers"
  end

end
