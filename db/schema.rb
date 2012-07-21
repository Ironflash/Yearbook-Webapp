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

ActiveRecord::Schema.define(:version => 20120720192137) do

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "parent_comment_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "story_id"
    t.integer  "comment_id"
  end

  add_index "comments", ["user_id", "created_at"], :name => "index_comments_on_user_id_and_created_at"

  create_table "homepage_updates", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "homepage_updates", ["created_at"], :name => "index_homepage_updates_on_created_at"

  create_table "meetings", :force => true do |t|
    t.string   "time"
    t.string   "date"
    t.string   "location"
    t.text     "note"
    t.string   "duration"
    t.string   "attendees"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "meetings", ["created_at"], :name => "index_meetings_on_created_at"

  create_table "stories", :force => true do |t|
    t.string   "topic"
    t.integer  "user_id"
    t.string   "date"
    t.string   "time"
    t.string   "location"
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "approved",    :default => 0
  end

  add_index "stories", ["user_id", "created_at", "date"], :name => "index_stories_on_user_id_and_created_at_and_date"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "position"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
