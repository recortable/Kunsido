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

ActiveRecord::Schema.define(:version => 20110404170319) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "name",       :null => false
    t.string   "body_mime"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "group_id",   :null => false
    t.integer  "user_id",    :null => false
    t.integer  "member_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reunions", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "group_id"
    t.string   "name",        :null => false
    t.string   "body_mime"
    t.text     "body"
    t.datetime "starting_at"
    t.datetime "ending_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "reunion_id"
    t.integer  "group_id",   :null => false
    t.string   "name",       :null => false
    t.string   "body_mime"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                             :null => false
    t.string   "email"
    t.boolean  "admin",         :default => false
    t.boolean  "invited",       :default => false
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.string   "resource"
    t.string   "user"
    t.string   "group"
    t.integer  "group_id"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
