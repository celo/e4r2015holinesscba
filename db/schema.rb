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

ActiveRecord::Schema.define(version: 20170311020618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_accommodations_on_event_id", using: :btree
  end

  create_table "attendees", force: :cascade do |t|
    t.string   "name"
    t.string   "tag_name"
    t.date     "birth_date"
    t.integer  "gender"
    t.string   "address"
    t.string   "neighborhood"
    t.integer  "city_id"
    t.string   "cep"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "email"
    t.integer  "church_id"
    t.integer  "payment_plan_id"
    t.boolean  "food_restriction"
    t.string   "food_restriction_notes"
    t.text     "family"
    t.integer  "accommodation_id"
    t.datetime "arrival_date"
    t.string   "arrival_options"
    t.text     "arrival_notes"
    t.text     "extra_notes"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["accommodation_id"], name: "index_attendees_on_accommodation_id", using: :btree
    t.index ["church_id"], name: "index_attendees_on_church_id", using: :btree
    t.index ["city_id"], name: "index_attendees_on_city_id", using: :btree
    t.index ["payment_plan_id"], name: "index_attendees_on_payment_plan_id", using: :btree
  end

  create_table "churches", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "abbr"
    t.index ["city_id"], name: "index_churches_on_city_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_plans", force: :cascade do |t|
    t.string   "name"
    t.text     "info"
    t.string   "abbr"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_payment_plans_on_event_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accommodations", "events"
  add_foreign_key "attendees", "accommodations"
  add_foreign_key "attendees", "churches"
  add_foreign_key "attendees", "cities"
  add_foreign_key "attendees", "payment_plans"
  add_foreign_key "churches", "cities"
  add_foreign_key "cities", "states"
  add_foreign_key "payment_plans", "events"
end
