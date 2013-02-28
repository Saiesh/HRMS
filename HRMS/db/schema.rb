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

ActiveRecord::Schema.define(:version => 20130225170858) do

  create_table "addresses", :force => true do |t|
    t.string   "addressLine1"
    t.string   "addressLine2"
    t.string   "city"
    t.string   "state"
    t.integer  "pincode"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "centres", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "departments", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "departments_id"
    t.string   "holidays"
    t.string   "description"
    t.text     "supported_role_ids"
  end

  create_table "employee_profiles", :force => true do |t|
    t.date     "dob"
    t.integer  "accounts_id"
    t.float    "bankAccount_number"
    t.integer  "address_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "employees_id"
  end

  create_table "employees", :force => true do |t|
    t.integer  "employees_id"
    t.string   "name"
    t.string   "email"
    t.integer  "manager_id"
    t.boolean  "is_manager"
    t.integer  "level"
    t.integer  "roles_id"
    t.integer  "departments_id"
    t.integer  "documents_id"
    t.integer  "assets_id"
    t.integer  "centres_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "locations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "roles_id"
    t.string   "role_name"
    t.string   "role_description"
  end

end
