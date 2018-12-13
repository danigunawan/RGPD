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

ActiveRecord::Schema.define(version: 2018_12_13_144056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "modifications", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "string"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "title"
    t.boolean "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unsubscriptions", force: :cascade do |t|
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "unsubscription_id"
    t.bigint "request_id"
    t.bigint "modification_id"
    t.index ["modification_id"], name: "index_users_on_modification_id"
    t.index ["request_id"], name: "index_users_on_request_id"
    t.index ["unsubscription_id"], name: "index_users_on_unsubscription_id"
  end

  add_foreign_key "users", "modifications"
  add_foreign_key "users", "requests"
  add_foreign_key "users", "unsubscriptions"
end
