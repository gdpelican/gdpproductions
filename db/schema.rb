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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120404214229) do

  create_table "links", :force => true do |t|
    t.string    "text"
    t.string    "link"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string    "name"
    t.string    "salt"
    t.string    "pass_hash"
    t.string    "email"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string    "alt"
    t.string    "caption"
    t.integer   "show_id"
    t.string    "picture_file_name"
    t.string    "picture_content_type"
    t.integer   "picture_file_size"
    t.timestamp "picture_updated_at"
    t.boolean   "cover_photo_ind"
    t.timestamp "created_at",           :null => false
    t.timestamp "updated_at",           :null => false
  end

  add_index "pictures", ["show_id"], :name => "index_pictures_on_show_id"

  create_table "sessions", :force => true do |t|
    t.integer   "person_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "shows", :force => true do |t|
    t.string    "title"
    t.date      "start_date"
    t.date      "end_date"
    t.text      "description"
    t.string    "blurb"
    t.string    "thumb_file_name"
    t.string    "thumb_content_type"
    t.integer   "thumb_file_size"
    t.timestamp "thumb_updated_at"
    t.integer   "venue_id"
    t.timestamp "created_at",         :null => false
    t.timestamp "updated_at",         :null => false
    t.string    "ticket_link"
    t.string    "photographer"
  end

  create_table "venues", :force => true do |t|
    t.string    "name"
    t.string    "address"
    t.string    "latitude"
    t.string    "longitude"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

end
