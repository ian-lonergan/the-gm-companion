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

ActiveRecord::Schema.define(version: 20140413014037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_objects", force: true do |t|
    t.string   "name"
    t.string   "abstract"
    t.integer  "campaign_object_holder_id"
    t.string   "campaign_object_holder_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campaign_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "outline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  create_table "characters", force: true do |t|
    t.string  "character_class"
    t.string  "race"
    t.integer "level"
    t.string  "gender"
    t.text    "description"
  end

  create_table "invitations", force: true do |t|
    t.string "key"
  end

  create_table "locations", force: true do |t|
    t.string   "map_file_name"
    t.string   "map_content_type"
    t.integer  "map_file_size"
    t.datetime "map_updated_at"
    t.text     "map_key"
  end

  create_table "notes", force: true do |t|
    t.string   "text"
    t.integer  "campaign_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.text "story_text"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

end
