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

ActiveRecord::Schema.define(:version => 20110516025028) do

  create_table "dentistries", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "hours"
    t.integer  "dentistry_id"
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
    t.string   "sex"
    t.string   "height"
    t.integer  "weight"
    t.string   "marital"
    t.string   "spouse_name"
    t.string   "closest_relative"
    t.string   "closest_relative_phone"
    t.string   "relation_to_other_person"
    t.string   "refered_by"
    t.integer  "age"
    t.string   "pager"
    t.string   "emp"
    t.string   "emp_term"
    t.string   "emp_address"
    t.string   "emp_city"
    t.string   "emp_state"
    t.string   "emp_zip"
    t.string   "resp_name"
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
    t.string   "spouse_name_2"
    t.string   "spouse_empl"
    t.string   "spouse_workph"
    t.string   "primary_name"
    t.string   "primary_phone"
    t.string   "primary_group"
    t.string   "primary_insured_name"
    t.string   "primary_relation"
    t.string   "primary_ssn"
    t.string   "primary_employer"
    t.string   "secondary_name"
    t.string   "secondary_phone"
    t.string   "secondary_group"
    t.string   "secondary_insured_name"
    t.string   "secondary_relation"
    t.string   "secondary_ssn"
    t.string   "secondary_employer"
    t.string   "physician_name"
    t.string   "physician_phone"
    t.string   "medical_conditions"
    t.string   "other_yes"
    t.string   "physicial_yes"
    t.string   "hospital_yes"
    t.string   "medications_yes"
    t.string   "allergic_yes"
    t.string   "tobacco_yes"
    t.string   "for_women"
    t.string   "women"
    t.string   "x_rays"
    t.string   "feal_dentist"
    t.string   "mouth_teeth"
    t.string   "teeth_appearance"
    t.string   "state_of_health"
    t.string   "main_concerns"
    t.string   "enhance_smile"
    t.string   "health_level1"
    t.string   "same_above_personal"
    t.string   "same_above_relation"
    t.string   "tobacco"
    t.string   "allergic"
    t.string   "medications"
    t.string   "hospital_admitted"
    t.string   "physicial_care"
    t.string   "other"
    t.string   "dob"
    t.string   "resp_dob"
    t.string   "spouse_dob_2"
    t.string   "primary_insured_dob"
    t.string   "secondary_insured_dob"
    t.string   "signature"
    t.string   "signature_date"
    t.string   "pref_name"
    t.integer  "user_id"
  end

  create_table "states", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "administrator"
    t.integer  "location_admin_id"
  end

end
