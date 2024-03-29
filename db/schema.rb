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

ActiveRecord::Schema.define(version: 20150609161303) do

  create_table "contents", force: true do |t|
    t.string   "title",                   default: "", null: false
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_content"
    t.integer  "read_count",              default: 0,  null: false
    t.integer  "praise_count",            default: 0,  null: false
    t.integer  "type_id",       limit: 1
  end

  add_index "contents", ["user_id"], name: "FK_USER_ID", using: :btree

  create_table "types", primary_key: "type_id", force: true do |t|
    t.string "type_name", limit: 50
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], name: "ux_name", unique: true, using: :btree

end
