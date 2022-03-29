# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_29_045514) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "producers", force: :cascade do |t|
    t.string "producer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "record_producers", force: :cascade do |t|
    t.integer "record_id", null: false
    t.integer "producer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producer_id"], name: "index_record_producers_on_producer_id"
    t.index ["record_id"], name: "index_record_producers_on_record_id"
  end

  create_table "record_writers", force: :cascade do |t|
    t.integer "record_id", null: false
    t.integer "writer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_record_writers_on_record_id"
    t.index ["writer_id"], name: "index_record_writers_on_writer_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.boolean "sale"
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_records_on_genre_id"
  end

  create_table "writers", force: :cascade do |t|
    t.string "writer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "record_producers", "producers"
  add_foreign_key "record_producers", "records"
  add_foreign_key "record_writers", "records"
  add_foreign_key "record_writers", "writers"
  add_foreign_key "records", "genres"
end
