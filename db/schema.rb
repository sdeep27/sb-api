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

ActiveRecord::Schema.define(version: 20170329043959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "param"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "company_id"
    t.decimal  "cost",       precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["company_id"], name: "index_courses_on_company_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_roles_on_company_id", using: :btree
  end

  create_table "skill_associations", force: :cascade do |t|
    t.integer  "skill_id"
    t.string   "regarding_type"
    t.integer  "regarding_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["regarding_type", "regarding_id"], name: "index_skill_associations_on_regarding_type_and_regarding_id", using: :btree
    t.index ["skill_id"], name: "index_skill_associations_on_skill_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courses", "companies"
  add_foreign_key "roles", "companies"
  add_foreign_key "skill_associations", "skills"
end