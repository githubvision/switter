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

ActiveRecord::Schema.define(version: 20170611163310) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "content"
    t.bigint "swit_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swit_id"], name: "index_comments_on_swit_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "sours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "sourer_id"
    t.bigint "swit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swit_id"], name: "index_sours_on_swit_id"
  end

  create_table "sweets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "sweeter_id"
    t.bigint "swit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swit_id"], name: "index_sweets_on_swit_id"
  end

  create_table "swits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "post"
    t.integer "sweets_count"
    t.integer "sours_count"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sours"
    t.string "sweets"
    t.index ["user_id"], name: "index_swits_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.date "birthday"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
  end

  add_foreign_key "comments", "swits"
  add_foreign_key "comments", "users"
  add_foreign_key "sours", "swits"
  add_foreign_key "sweets", "swits"
  add_foreign_key "swits", "users"
end
