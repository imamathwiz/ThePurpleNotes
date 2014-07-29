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

ActiveRecord::Schema.define(version: 20140729180828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notebooks", force: true do |t|
    t.string   "title",      null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notebooks", ["user_id"], name: "index_notebooks_on_user_id", using: :btree

  create_table "notes", force: true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "notebook_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["notebook_id"], name: "index_notes_on_notebook_id", using: :btree

  create_table "sharings", force: true do |t|
    t.integer  "note_id",                   null: false
    t.string   "url",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true, null: false
  end

  add_index "sharings", ["note_id"], name: "index_sharings_on_note_id", unique: true, using: :btree
  add_index "sharings", ["url"], name: "index_sharings_on_url", unique: true, using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id",     null: false
    t.integer  "note_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id", "note_id"], name: "index_taggings_on_tag_id_and_note_id", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",         null: false
    t.string   "password_diguest", null: false
    t.string   "session_token",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
