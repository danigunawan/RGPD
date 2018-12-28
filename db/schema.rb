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

ActiveRecord::Schema.define(version: 2018_12_28_195151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "unsubscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["unsubscription_id"], name: "index_choices_on_unsubscription_id"
    t.index ["user_id"], name: "index_choices_on_user_id"
  end

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
    t.bigint "user_id"
    t.index ["user_id"], name: "index_modifications_on_user_id"
  end

  create_table "officers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_officers_on_email", unique: true
  end

  create_table "requests", force: :cascade do |t|
    t.string "title"
    t.boolean "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "unsubscriptions", force: :cascade do |t|
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "specific"
    t.index ["user_id"], name: "index_unsubscriptions_on_user_id"
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
    t.boolean "archived"
    t.index ["request_id"], name: "index_users_on_request_id"
    t.index ["unsubscription_id"], name: "index_users_on_unsubscription_id"
  end

  add_foreign_key "choices", "unsubscriptions"
  add_foreign_key "choices", "users"
  add_foreign_key "modifications", "users"
  add_foreign_key "unsubscriptions", "users"
  add_foreign_key "users", "requests"
  add_foreign_key "users", "unsubscriptions"
end
