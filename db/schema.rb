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

ActiveRecord::Schema.define(:version => 20140727162824) do

  create_table "comments", :force => true do |t|
    t.text     "message"
    t.string   "author"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.integer  "pictureable_id"
    t.string   "pictureable_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["pictureable_id"], :name => "index_pictures_on_pictureable_id"

  create_table "posts", :force => true do |t|
    t.string   "author"
    t.string   "title"
    t.text     "body"
    t.datetime "published_at"
    t.boolean  "featured",     :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "completion_date"
    t.string   "url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "surveys", :force => true do |t|
    t.string   "family_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "primary_phone"
    t.boolean  "primary_home"
    t.integer  "secondary_phone"
    t.boolean  "secondary_home"
    t.string   "primary_email"
    t.string   "secondary_email"
    t.string   "emergency_contact"
    t.integer  "emergency_contact_phone"
    t.string   "emergency_contact_relationship"
    t.boolean  "food_supply"
    t.integer  "food_amount"
    t.boolean  "water_supply"
    t.integer  "water_amount"
    t.string   "first_name"
    t.integer  "age"
    t.string   "email_same"
    t.string   "special_medical"
    t.boolean  "skill"
    t.string   "skill_explained"
    t.boolean  "medical_training"
    t.string   "medical_training_explained"
    t.boolean  "equipment"
    t.string   "equipment_explained"
    t.boolean  "tools"
    t.string   "tools_explained"
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "tags", ["taggable_id"], :name => "index_tags_on_taggable_id"

  create_table "tools", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tools", ["project_id"], :name => "index_tools_on_project_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "password_digest"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.boolean  "lunicorn",                     :default => false
  end

end
