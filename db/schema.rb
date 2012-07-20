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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120720212809) do

  create_table "invitations", :force => true do |t|
    t.string   "invite_code"
    t.integer  "user_id"
    t.integer  "plan_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "plan_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "memberships", ["plan_id"], :name => "index_memberships_on_plan_id"
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "picks", :force => true do |t|
    t.integer  "place_id"
    t.integer  "plan_id"
    t.datetime "from"
    t.datetime "until"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "picks", ["place_id"], :name => "index_picks_on_place_id"
  add_index "picks", ["plan_id"], :name => "index_picks_on_plan_id"

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "foursquare_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.datetime "from"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "foursquare_id"
    t.string   "foursquare_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "avatar"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "facebook_id"
    t.string   "facebook_token"
  end

  add_index "users", ["facebook_id"], :name => "index_users_on_facebook_id"
  add_index "users", ["foursquare_id"], :name => "index_users_on_foursquare_id"

end
