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

ActiveRecord::Schema.define(version: 20151230215623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "followings", force: :cascade do |t|
    t.integer "user_id",      null: false
    t.integer "following_id", null: false
  end

  add_index "followings", ["following_id", "user_id"], name: "index_followings_on_following_id_and_user_id", unique: true, using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "user_id",     null: false
  end

  add_index "follows", ["follower_id", "user_id"], name: "index_follows_on_follower_id_and_user_id", unique: true, using: :btree

  create_table "retweets", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "tweet_id",   null: false
    t.text     "comment",    null: false
    t.text     "tweets",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: :cascade do |t|
    t.text     "tweet",      null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username",        null: false
    t.string "password_digest", null: false
    t.string "session_token",   null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
