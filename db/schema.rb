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

ActiveRecord::Schema.define(version: 20150826205450) do

  create_table "adoption_requests", force: :cascade do |t|
    t.integer  "gems_adoption_id", null: false
    t.integer  "user_id",          null: false
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "gem_ownership_transfers", force: :cascade do |t|
    t.integer  "old_user_id", null: false
    t.integer  "new_user_id", null: false
    t.integer  "ruby_gem_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "gem_ownership_transfers", ["new_user_id"], name: "index_gem_ownership_transfers_on_new_user_id"
  add_index "gem_ownership_transfers", ["old_user_id"], name: "index_gem_ownership_transfers_on_old_user_id"
  add_index "gem_ownership_transfers", ["ruby_gem_id"], name: "index_gem_ownership_transfers_on_ruby_gem_id"

  create_table "gems_adoptions", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.integer  "ruby_gem_id",             null: false
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status",      default: 0
  end

  add_index "gems_adoptions", ["ruby_gem_id"], name: "index_gems_adoptions_on_ruby_gem_id"
  add_index "gems_adoptions", ["user_id"], name: "index_gems_adoptions_on_user_id"

  create_table "ruby_gems", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "info"
    t.string   "project_uri"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ruby_gems", ["name"], name: "index_ruby_gems_on_name"

  create_table "ruby_gems_users", id: false, force: :cascade do |t|
    t.integer "ruby_gem_id"
    t.integer "user_id"
  end

  add_index "ruby_gems_users", ["ruby_gem_id"], name: "index_ruby_gems_users_on_ruby_gem_id"
  add_index "ruby_gems_users", ["user_id"], name: "index_ruby_gems_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.string   "token",      null: false
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
