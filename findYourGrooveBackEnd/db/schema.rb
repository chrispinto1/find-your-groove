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

ActiveRecord::Schema.define(version: 2019_07_10_201052) do

  create_table "band_subgenres", force: :cascade do |t|
    t.integer "band_id"
    t.integer "subgenre_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres", force: :cascade do |t|
    t.string "category"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "band_id"
    t.integer "user_id"
    t.index ["band_id"], name: "index_likes_on_band_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.integer "band_id"
    t.string "spoitfy_snippet"
    t.index ["band_id"], name: "index_songs_on_band_id"
  end

  create_table "subgenres", force: :cascade do |t|
    t.string "category"
    t.integer "genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
