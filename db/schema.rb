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

ActiveRecord::Schema.define(version: 2021_03_04_112827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "consultation_id"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "likes_count"
  end

  create_table "consultations", force: :cascade do |t|
    t.string "disclaimer"
    t.string "title"
    t.string "history"
    t.string "exam"
    t.string "impression"
    t.string "plan"
    t.string "additional_info"
    t.string "broshure"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "comments_count"
    t.integer "likes_count"
  end

  create_table "likes", force: :cascade do |t|
    t.string "likable_type"
    t.bigint "likable_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["likable_type", "likable_id"], name: "index_likes_on_likable_type_and_likable_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "auth_token"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.string "avatar"
    t.string "imc"
    t.string "password_digest"
    t.string "gp_type"
    t.string "practice_name"
    t.string "country"
    t.string "county"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "auth_token"
    t.string "user_types"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "reset_password_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
  end

end
