# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_24_013213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gallery_items", force: :cascade do |t|
    t.integer "number"
    t.string "title"
    t.text "plot"
    t.string "type"
    t.integer "season_id"
    t.integer "episode_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gallery_items_purchase_options", force: :cascade do |t|
    t.integer "gallery_item_id"
    t.integer "purchase_option_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "library_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gallery_item_id"
    t.integer "purchase_option_id"
    t.datetime "expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchase_options", force: :cascade do |t|
    t.float "price"
    t.string "video_quality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
