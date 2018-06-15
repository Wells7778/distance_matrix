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

ActiveRecord::Schema.define(version: 20180615122450) do

  create_table "distances", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "respond_list"
    t.text "geo_address"
    t.string "post_code"
  end

  create_table "services", force: :cascade do |t|
    t.string "tag"
    t.string "no"
    t.string "name"
    t.string "lng"
    t.string "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_code"
  end

end
