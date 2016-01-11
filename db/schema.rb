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

ActiveRecord::Schema.define(version: 20160111030111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.string   "uasid"
    t.integer  "primary_respondent"
    t.string   "uashhid"
    t.string   "survhhid"
    t.integer  "uasmembers"
    t.integer  "sampletype"
    t.integer  "batch"
    t.integer  "language"
    t.date     "start_date"
    t.integer  "start_year"
    t.integer  "start_month"
    t.integer  "start_day"
    t.integer  "start_hour"
    t.integer  "start_min"
    t.integer  "start_sec"
    t.integer  "end_year"
    t.integer  "end_month"
    t.integer  "end_day"
    t.integer  "end_hour"
    t.integer  "end_min"
    t.integer  "end_sec"
    t.date     "end_date"
    t.integer  "cs_001"
    t.integer  "gender"
    t.integer  "dateofbirth_day"
    t.integer  "dateofbirth_month"
    t.integer  "dateofbirth_year"
    t.integer  "age"
    t.integer  "agerange"
    t.boolean  "citizenus"
    t.boolean  "bornus"
    t.integer  "stateborn"
    t.integer  "countryborn"
    t.string   "countryborn_other"
    t.integer  "statereside"
    t.integer  "maritalstatus"
    t.boolean  "livewithpartner"
    t.integer  "education"
    t.boolean  "hisplatino"
    t.boolean  "white"
    t.boolean  "black"
    t.boolean  "nativeamer"
    t.boolean  "asian"
    t.boolean  "pacific"
    t.integer  "race"
    t.boolean  "working"
    t.boolean  "sick_leave"
    t.boolean  "unemp_layoff"
    t.boolean  "unemp_look"
    t.boolean  "retired"
    t.boolean  "disabled"
    t.string   "lf_other"
    t.integer  "laborstatus"
    t.integer  "employmenttype"
    t.integer  "workfullpart"
    t.integer  "hourswork"
    t.integer  "hhincome"
    t.boolean  "anyhhmember"
    t.integer  "hhmembernumber"
    t.date     "lastmyhh_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "members", force: :cascade do |t|
    t.boolean  "hhmemberin"
    t.integer  "hhmembergen"
    t.integer  "hhmemberage"
    t.integer  "hhmemberrel"
    t.string   "hhmemberuasid"
    t.integer  "entry_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
