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

ActiveRecord::Schema.define(version: 2019_10_26_115059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_clips_on_event_id"
    t.index ["user_id", "event_id"], name: "index_clips_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_clips_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "gig_date", default: -> { "now()" }, null: false
    t.integer "target_join_num"
    t.string "region", null: false
    t.string "location"
    t.integer "target_price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genre", default: "ALL", null: false
    t.integer "user_id", default: 0, null: false
    t.boolean "fixed", default: false, null: false
  end

  create_table "follow_relations", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_follow_relations_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_follow_relations_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_follow_relations_on_follower_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "fixed", default: false, null: false
    t.index ["event_id"], name: "index_participations_on_event_id"
    t.index ["user_id", "event_id"], name: "index_participations_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login_name"
    t.string "name", default: "", null: false
    t.string "region"
    t.text "profile"
    t.integer "men_num"
    t.integer "women_num"
    t.string "genre", default: "", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login_name"], name: "index_users_on_login_name", unique: true
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
