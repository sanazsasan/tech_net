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

ActiveRecord::Schema.define(version: 20140717003239) do

  create_table "assoteches", force: true do |t|
    t.integer  "tech_id"
    t.integer  "peer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "password"
    t.string   "experiences"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "filename"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "members_teches", id: false, force: true do |t|
    t.integer "member_id", null: false
    t.integer "tech_id",   null: false
  end

  add_index "members_teches", ["member_id", "tech_id"], name: "index_members_teches_on_member_id_and_tech_id"
  add_index "members_teches", ["tech_id", "member_id"], name: "index_members_teches_on_tech_id_and_member_id"

  create_table "rates", force: true do |t|
    t.integer "rater_id"
    t.integer "rated_id"
    t.integer "score"
  end

  add_index "rates", ["rater_id", "rated_id"], name: "index_rates_on_rater_id_and_rated_id", unique: true

  create_table "teches", force: true do |t|
    t.string   "tech_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
