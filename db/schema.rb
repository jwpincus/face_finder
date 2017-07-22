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

ActiveRecord::Schema.define(version: 20170722052033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_owners", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_app_owners_on_app_id"
    t.index ["user_id"], name: "index_app_owners_on_user_id"
  end

  create_table "app_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_app_users_on_app_id"
    t.index ["user_id"], name: "index_app_users_on_user_id"
  end

  create_table "apps", force: :cascade do |t|
    t.string "name"
    t.float "min_confidence", default: 0.6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "user_id"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "response", default: {}, null: false
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "app_owners", "apps"
  add_foreign_key "app_owners", "users"
  add_foreign_key "app_users", "apps"
  add_foreign_key "app_users", "users"
  add_foreign_key "enrollments", "users"
end
