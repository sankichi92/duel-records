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

ActiveRecord::Schema.define(version: 20150724023129) do

  create_table "duels", force: :cascade do |t|
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.date     "date",        null: false
    t.integer  "life_points"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "duels", ["loser_id"], name: "index_duels_on_loser_id"
  add_index "duels", ["winner_id"], name: "index_duels_on_winner_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider",                  null: false
    t.string   "uid",                       null: false
    t.string   "nickname",                  null: false
    t.string   "image_url",                 null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "rating",     default: 1500, null: false
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true

end
