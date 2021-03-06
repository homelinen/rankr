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

ActiveRecord::Schema.define(:version => 20130406002447) do

  create_table "awards", :force => true do |t|
    t.integer  "match_id"
    t.integer  "amount"
    t.string   "username",   :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "awards", ["match_id"], :name => "index_awards_on_tournament_id"

  create_table "matches", :force => true do |t|
    t.string   "name"
    t.integer  "tournament_id"
    t.string   "game"
    t.datetime "start"
    t.integer  "duration"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "matches", ["tournament_id"], :name => "index_matches_on_tournament_id"

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.date     "start"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tournaments", ["user_id"], :name => "index_tournaments_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",                               :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
