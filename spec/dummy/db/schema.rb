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

ActiveRecord::Schema.define(version: 20150522103016) do

  create_table "pig_content_packages", force: :cascade do |t|
    t.string   "slug"
    t.string   "name"
    t.integer  "content_type_id"
    t.integer  "position",         default: 0
    t.integer  "parent_id"
    t.integer  "author_id"
    t.integer  "requested_by_id"
    t.string   "status",           default: "draft"
    t.boolean  "logged_in_only",   default: false
    t.boolean  "hide_from_robots", default: false
    t.text     "notes"
    t.date     "due_date"
    t.integer  "review_frequency"
    t.date     "next_review"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pig_content_packages", ["parent_id"], name: "index_pig_content_packages_on_parent_id"
  add_index "pig_content_packages", ["slug"], name: "index_pig_content_packages_on_slug"

end
