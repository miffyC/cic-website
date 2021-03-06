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

ActiveRecord::Schema.define(version: 20141218132723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_sessions", force: true do |t|
    t.string   "name"
    t.integer  "ad_id"
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ads", force: true do |t|
    t.string   "name"
    t.date     "vote_date"
    t.date     "term_start"
    t.date     "term_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "committees", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elections", force: true do |t|
    t.integer  "ad_id"
    t.integer  "legislator_id"
    t.integer  "party_id"
    t.string   "constituency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "source_url"
    t.string   "source_name"
    t.date     "date"
    t.string   "user_ip"
    t.boolean  "published",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries_keywords", id: false, force: true do |t|
    t.integer "keyword_id"
    t.integer "entry_id"
  end

  add_index "entries_keywords", ["keyword_id", "entry_id"], name: "index_entries_keywords_on_keyword_id_and_entry_id", unique: true, using: :btree

  create_table "entries_legislators", id: false, force: true do |t|
    t.integer "legislator_id"
    t.integer "entry_id"
  end

  add_index "entries_legislators", ["legislator_id", "entry_id"], name: "index_entries_legislators_on_legislator_id_and_entry_id", unique: true, using: :btree

  create_table "keywords", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords_questions", id: false, force: true do |t|
    t.integer "keyword_id"
    t.integer "question_id"
  end

  add_index "keywords_questions", ["keyword_id", "question_id"], name: "index_keywords_questions_on_keyword_id_and_question_id", unique: true, using: :btree

  create_table "keywords_videos", id: false, force: true do |t|
    t.integer "keyword_id"
    t.integer "video_id"
  end

  add_index "keywords_videos", ["keyword_id", "video_id"], name: "index_keywords_videos_on_keyword_id_and_video_id", unique: true, using: :btree

  create_table "legislators", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.boolean  "in_office"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "legislators_questions", id: false, force: true do |t|
    t.integer "legislator_id"
    t.integer "question_id"
  end

  add_index "legislators_questions", ["legislator_id", "question_id"], name: "index_legislators_questions_on_legislator_id_and_question_id", unique: true, using: :btree

  create_table "legislators_videos", id: false, force: true do |t|
    t.integer "legislator_id"
    t.integer "video_id"
  end

  add_index "legislators_videos", ["legislator_id", "video_id"], name: "index_legislators_videos_on_legislator_id_and_video_id", unique: true, using: :btree

  create_table "parties", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "committee_id"
    t.integer  "ad_session_id"
    t.text     "meeting_description"
    t.string   "ivod_url"
    t.time     "time_start"
    t.time     "time_end"
    t.string   "target"
    t.date     "date"
    t.text     "comment"
    t.string   "user_ip"
    t.boolean  "published",           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "provider_uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "video_type"
    t.integer  "user_id"
    t.integer  "committee_id"
    t.integer  "ad_session_id"
    t.text     "meeting_description"
    t.string   "youtube_url"
    t.string   "youtube_id"
    t.string   "image"
    t.string   "ivod_url"
    t.string   "source_url"
    t.string   "source_name"
    t.time     "time_start"
    t.time     "time_end"
    t.date     "date"
    t.string   "user_ip"
    t.boolean  "published",           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
