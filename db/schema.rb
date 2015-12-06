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

ActiveRecord::Schema.define(version: 20151206003253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "phoneme_types", force: :cascade do |t|
    t.string "phoneme_type", limit: 255
  end

  create_table "phonemes", force: :cascade do |t|
    t.string  "spelling",        limit: 255
    t.integer "phoneme_type_id"
  end

  create_table "words", force: :cascade do |t|
    t.string   "spelling",      limit: 255
    t.string   "pronunciation", limit: 255
    t.integer  "syllables"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["pronunciation"], name: "index_words_on_pronunciation", using: :btree

end
