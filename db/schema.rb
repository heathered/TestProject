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

ActiveRecord::Schema.define(version: 20140825155755) do

  create_table "appts", force: true do |t|
    t.integer  "groomer_id"
    t.integer  "pet_id"
    t.datetime "date"
  end

  create_table "groomers", force: true do |t|
    t.string "name"
  end

  create_table "groomers_users", force: true do |t|
    t.integer "groomer_id"
    t.integer "pet_id"
  end

  create_table "notes", force: true do |t|
    t.integer "appt_id"
    t.text    "note"
  end

  create_table "pets", force: true do |t|
    t.string "name"
  end

end
