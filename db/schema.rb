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

ActiveRecord::Schema.define(:version => 20140220234120) do

  create_table "service_types", :force => true do |t|
    t.string   "mode"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "station_areas", :force => true do |t|
    t.string   "location"
    t.string   "station_name"
    t.integer  "etod_score"
    t.decimal  "vehicle_miles_traveled"
    t.decimal  "transit_commute_share"
    t.decimal  "vehicle_ownership"
    t.decimal  "transportation_ghgs"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "station_areas_transit_lines", :force => true do |t|
    t.integer "station_area_id"
    t.integer "transit_line_id"
  end

  create_table "transit_lines", :force => true do |t|
    t.string   "name"
    t.integer  "service_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
