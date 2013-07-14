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

ActiveRecord::Schema.define(:version => 20130714161501) do

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "admins", ["remember_token"], :name => "index_admins_on_remember_token"
  add_index "admins", ["username"], :name => "index_admins_on_username", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "reply"
    t.integer  "ticket_id"
    t.integer  "admin_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["admin_id"], :name => "index_comments_on_admin_id"
  add_index "comments", ["ticket_id"], :name => "index_comments_on_ticket_id"

  create_table "statuses", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "statuses", ["value"], :name => "index_statuses_on_value", :unique => true

  create_table "tickets", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "issue"
    t.string   "subject"
    t.text     "body"
    t.string   "unique_reference"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "status_id"
    t.integer  "admin_id"
  end

  add_index "tickets", ["admin_id"], :name => "index_tickets_on_admin_id"
  add_index "tickets", ["status_id"], :name => "index_tickets_on_status_id"
  add_index "tickets", ["unique_reference"], :name => "index_tickets_on_unique_reference", :unique => true

end
