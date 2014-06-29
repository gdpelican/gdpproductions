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

ActiveRecord::Schema.define(:version => 20131215192222) do

  create_table "categories", :force => true do |t|
    t.string "name"
    t.string "type"
  end

  create_table "categories_resources", :force => true do |t|
    t.integer "resource_id"
    t.integer "category_id"
  end

  add_index "categories_resources", ["category_id"], :name => "index_categories_resources_on_category_id"
  add_index "categories_resources", ["resource_id"], :name => "index_categories_resources_on_resource_id"

  create_table "links", :force => true do |t|
    t.string   "text"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "owners_possessions", :id => false, :force => true do |t|
    t.integer "owner_id"
    t.integer "possession_id"
  end

  add_index "owners_possessions", ["owner_id"], :name => "index_owners_possessions_on_owner_id"
  add_index "owners_possessions", ["possession_id"], :name => "index_owners_possessions_on_possession_id"

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "salt"
    t.string   "pass_hash"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "alt"
    t.string   "caption"
    t.integer  "show_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "cover_photo_ind"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "photographer"
  end

  add_index "pictures", ["show_id"], :name => "index_pictures_on_show_id"

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.string   "preview"
    t.string   "type"
    t.text     "description"
    t.boolean  "active",               :default => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources_tags", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "resource_id"
  end

  add_index "resources_tags", ["resource_id"], :name => "index_resources_tags_on_resource_id"
  add_index "resources_tags", ["tag_id"], :name => "index_resources_tags_on_tag_id"

  create_table "sessions", :force => true do |t|
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shows", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.string   "blurb"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
    t.integer  "venue_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "ticket_link"
    t.string   "photographer"
  end

  create_table "socials", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.string   "alt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "tag_types", :force => true do |t|
    t.string "name"
    t.string "resource"
    t.string "category"
  end

  create_table "tags", :force => true do |t|
    t.integer "tag_type_id"
    t.string  "tag"
  end

  create_table "users", :force => true do |t|
    t.integer  "person_id"
    t.boolean  "admin",                  :default => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
