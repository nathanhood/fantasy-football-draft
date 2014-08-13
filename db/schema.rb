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

ActiveRecord::Schema.define(version: 2014080885230) do

  create_table "leagues", force: true do |t|
    t.string  "name"
    t.integer "draft_round",    default: 0
    t.integer "round_position", default: -1
  end

  create_table "players", force: true do |t|
    t.string  "name"
    t.string  "position"
    t.string  "nfl_team"
    t.integer "rank"
    t.integer "team_id"
  end

  create_table "teams", force: true do |t|
    t.string  "name"
    t.boolean "commissioner"
    t.integer "league_id"
  end

end
