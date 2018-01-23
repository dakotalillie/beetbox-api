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

ActiveRecord::Schema.define(version: 20180119181214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "folders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "parent_folder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_folder_id"], name: "index_folders_on_parent_folder_id"
  end

  create_table "folders_samples", id: false, force: :cascade do |t|
    t.uuid "folder_id"
    t.uuid "sample_id"
  end

  create_table "folders_users", id: false, force: :cascade do |t|
    t.uuid "folder_id"
    t.uuid "user_id"
  end

  create_table "libraries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "artwork_url"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["user_id"], name: "index_libraries_on_user_id"
  end

  create_table "samples", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "preview_url"
    t.string "instrument"
    t.string "sample_type"
    t.float "length"
    t.float "tempo"
    t.string "key"
    t.string "genre"
    t.integer "rating"
    t.boolean "favorite"
    t.uuid "user_id"
    t.uuid "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fullres_file_file_name"
    t.string "fullres_file_content_type"
    t.integer "fullres_file_file_size"
    t.datetime "fullres_file_updated_at"
    t.index ["library_id"], name: "index_samples_on_library_id"
    t.index ["user_id"], name: "index_samples_on_user_id"
  end

  create_table "samples_tags", id: false, force: :cascade do |t|
    t.uuid "sample_id"
    t.uuid "tag_id"
  end

  create_table "tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "libraries", "users"
  add_foreign_key "samples", "libraries"
  add_foreign_key "samples", "users"
  add_foreign_key "tags", "users"
end
