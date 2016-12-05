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

ActiveRecord::Schema.define(version: 20161205162908) do

  create_table "championships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "quantity_min_teams"
    t.datetime "date_initial_inscription"
    t.datetime "date_end_inscription"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "match_duration"
    t.integer  "matches_simultanius"
    t.string   "game_days"
  end

  create_table "details_matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "match_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "event_id"
    t.integer  "minute"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_details_matches_on_event_id", using: :btree
    t.index ["match_id"], name: "index_details_matches_on_match_id", using: :btree
    t.index ["player_id"], name: "index_details_matches_on_player_id", using: :btree
    t.index ["team_id"], name: "index_details_matches_on_team_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "is_goal",    limit: 1, default: 0
  end

  create_table "matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "local_id"
    t.integer  "visitant_id"
    t.datetime "match_date"
    t.integer  "date_number"
    t.integer  "championship_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "goals_local_team"
    t.integer  "goals_visitant_team"
    t.integer  "status",              limit: 1, default: 0
    t.index ["championship_id"], name: "index_matches_on_championship_id", using: :btree
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telefono"
    t.string   "email"
    t.string   "movil"
    t.string   "number_id"
    t.integer  "team_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "tshirt_number"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.integer  "status",                  limit: 1, default: 0
    t.integer  "yellow_cards",            limit: 1, default: 0
    t.integer  "red_cards",               limit: 1, default: 0
    t.integer  "penalized_matches",       limit: 1, default: 0
    t.integer  "matches_without_playing", limit: 1, default: 0
    t.index ["team_id"], name: "index_players_on_team_id", using: :btree
    t.index ["tshirt_number", "team_id"], name: "index_players_on_tshirt_number_and_team_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "curso"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "championship_id"
    t.string   "escudo_file_name"
    t.string   "escudo_content_type"
    t.integer  "escudo_file_size"
    t.datetime "escudo_updated_at"
    t.index ["championship_id"], name: "index_teams_on_championship_id", using: :btree
    t.index ["user_id"], name: "index_teams_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "Stores user data." do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "number_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "Maps users to roles." do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "details_matches", "events"
  add_foreign_key "details_matches", "matches"
  add_foreign_key "details_matches", "players"
  add_foreign_key "details_matches", "teams"
  add_foreign_key "matches", "championships"
  add_foreign_key "players", "teams"
  add_foreign_key "teams", "championships"
  add_foreign_key "teams", "users"
end
