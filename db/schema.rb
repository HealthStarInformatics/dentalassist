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

ActiveRecord::Schema.define(:version => 20110409194005) do

  create_table "forms", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicalhistories", :force => true do |t|
    t.string   "fname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middle_name"
    t.string   "home_phone"
    t.string   "biss_phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "occupation"
    t.string   "ssn"
    t.datetime "dob"
    t.string   "sex"
    t.string   "height"
    t.integer  "weight"
    t.string   "marital"
    t.string   "spouse_name"
    t.string   "closest_relative"
    t.string   "closest_relative_phone"
    t.integer  "age"
    t.string   "pager"
    t.string   "emp"
    t.string   "emp_term"
    t.string   "emp_address"
    t.string   "emp_city"
    t.string   "emp_state"
    t.string   "emp_zip"
    t.string   "resp_name"
    t.date     "resp_dob"
    t.string   "resp_relation"
    t.string   "resp_add"
    t.string   "resp_city"
    t.string   "resp_state"
    t.string   "resp_zip"
    t.string   "resp_home_phone"
    t.string   "resp_work_phone"
    t.string   "resp_ssn"
    t.string   "resp_emp"
    t.string   "resp_emp_term"
    t.string   "resp_occupation"
    t.date     "spouse_dob"
    t.string   "spouse_emp"
    t.string   "spouse_work_phone"
    t.string   "cell_phone"
    t.string   "email"
  end

  create_table "states", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
