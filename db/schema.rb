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

ActiveRecord::Schema.define(version: 20160409064716) do

  create_table "careerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "careerships", ["job_id"], name: "index_careerships_on_job_id"
  add_index "careerships", ["user_id", "job_id", "type"], name: "index_careerships_on_user_id_and_job_id_and_type", unique: true
  add_index "careerships", ["user_id"], name: "index_careerships_on_user_id"

  create_table "jobs", force: :cascade do |t|
    t.text     "name"
    t.text     "company"
    t.text     "product"
    t.text     "role"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skills", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "age"
    t.string   "sex"
    t.string   "skill"
    t.string   "current_job"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
