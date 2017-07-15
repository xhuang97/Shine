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

ActiveRecord::Schema.define(version: 20170714224331) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street_2"
    t.string   "street_1",   null: false
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.string   "zipcode",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "properties"
    t.datetime "time"
  end

  add_index "ahoy_events", ["name", "time"], name: "index_ahoy_events_on_name_and_time"
  add_index "ahoy_events", ["user_id", "name"], name: "index_ahoy_events_on_user_id_and_name"
  add_index "ahoy_events", ["visit_id", "name"], name: "index_ahoy_events_on_visit_id_and_name"

  create_table "assignments_user_regestries", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "registry_id"
  end

  create_table "fufillment_items", force: :cascade do |t|
    t.boolean  "userBoolean"
    t.text     "userText"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "news_letters", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity",   null: false
    t.string   "ItemName",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.float    "grand_total"
    t.date     "date_ordered", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       null: false
    t.boolean  "for_profit", null: false
    t.boolean  "is_active",  null: false
    t.string   "industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registries", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.boolean  "is_active",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "registry_item_fields", force: :cascade do |t|
    t.string   "prompt",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registry_items", force: :cascade do |t|
    t.integer  "y",            null: false
    t.integer  "x",            null: false
    t.string   "content_type", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "username"
    t.string   "password_digest"
    t.string   "role"
    t.boolean  "is_active",       default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "avatar"
  end

  create_table "visits", force: :cascade do |t|
    t.string   "visit_token"
    t.string   "visitor_token"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id"
  add_index "visits", ["visit_token"], name: "index_visits_on_visit_token", unique: true

end
