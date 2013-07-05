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

ActiveRecord::Schema.define(version: 20130703200228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "legislators", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "party"
    t.string   "phone"
    t.string   "state"
    t.string   "twitter_id"
    t.boolean  "in_office"
    t.string   "votesmart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.string   "name"
    t.string   "release_date"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "person_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todo", force: true do |t|
    t.string  "name",        limit: 25
    t.string  "description", limit: 45
    t.string  "date",        limit: 10
    t.boolean "completed"
  end

end
