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

ActiveRecord::Schema.define(version: 2020_07_10_200213) do

  create_table "brew_logs", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "method"
    t.string "boil_time"
    t.string "batch_size"
    t.string "pre_boil_size"
    t.string "pre_boil_gravity"
    t.string "target_fg"
    t.string "target_og"
    t.string "ibu"
    t.string "srm"
    t.string "mash_ph"
    t.string "mash_schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "method"
    t.string "boil_time"
    t.string "batch_size"
    t.string "pre_boil_size"
    t.string "pre_boil_gravity"
    t.string "target_fg"
    t.string "target_og"
    t.string "ibu"
    t.string "srm"
    t.string "mash_ph"
    t.string "mash_schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
