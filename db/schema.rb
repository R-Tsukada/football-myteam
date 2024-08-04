# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_04_082513) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitors", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_competitors_on_team_id"
    t.index ["user_id"], name: "index_competitors_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_favorites_on_team_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name", null: false
    t.string "logo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "api_id"
    t.index ["logo"], name: "index_leagues_on_logo", unique: true
    t.index ["name"], name: "index_leagues_on_name", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.string "season", null: false
    t.date "date", null: false
    t.string "competition_name", null: false
    t.string "competition_logo", null: false
    t.string "team_name", null: false
    t.string "team_logo", null: false
    t.string "home_score"
    t.string "away_score"
    t.string "home_and_away", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "home_team_name"
    t.string "away_team_name"
    t.string "home_logo"
    t.string "away_logo"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_matches_on_team_id"
  end

  create_table "standings", force: :cascade do |t|
    t.bigint "team_id"
    t.string "team_name", null: false
    t.string "team_logo", null: false
    t.integer "rank", null: false
    t.integer "points", null: false
    t.integer "played", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_standings_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "api_id", null: false
    t.string "name", null: false
    t.string "logo", null: false
    t.string "home_city", null: false
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stadium"
    t.integer "last_season_rank"
    t.string "code"
    t.boolean "active", default: true, null: false
    t.index ["api_id"], name: "index_teams_on_api_id", unique: true
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["logo"], name: "index_teams_on_logo", unique: true
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "competitors", "teams"
  add_foreign_key "competitors", "users"
  add_foreign_key "favorites", "teams"
  add_foreign_key "favorites", "users"
  add_foreign_key "matches", "teams"
  add_foreign_key "standings", "teams"
  add_foreign_key "teams", "leagues"
end
