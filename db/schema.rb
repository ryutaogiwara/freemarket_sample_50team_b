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

ActiveRecord::Schema.define(version: 2019_05_12_062406) do

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "image", null: false
    t.text "description", null: false
    t.string "state", null: false
    t.string "postage", null: false
    t.string "region", null: false
    t.string "shipping", null: false
    t.string "shipping_data", null: false
    t.integer "price", null: false
    t.string "category", null: false
    t.string "size", null: false
    t.string "brand"
    t.integer "saler_id", null: false
    t.integer "transaction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
