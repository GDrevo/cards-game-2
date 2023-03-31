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

ActiveRecord::Schema[7.0].define(version: 2023_03_30_160200) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "battle_cards", force: :cascade do |t|
    t.boolean "dead", default: false
    t.integer "counter", default: 0
    t.integer "hit_points"
    t.integer "armor"
    t.integer "power"
    t.integer "speed"
    t.integer "max_hp"
    t.integer "damage_taken", default: 0
    t.bigint "card_id", null: false
    t.bigint "battle_team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_team_id"], name: "index_battle_cards_on_battle_team_id"
    t.index ["card_id"], name: "index_battle_cards_on_card_id"
  end

  create_table "battle_teams", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_battle_teams_on_player_id"
  end

  create_table "battles", force: :cascade do |t|
    t.string "result"
    t.bigint "player_id", null: false
    t.bigint "challenge_id", null: false
    t.bigint "bt_computer_id", null: false
    t.bigint "bt_player_id", null: false
    t.integer "turn_number", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bt_computer_id"], name: "index_battles_on_bt_computer_id"
    t.index ["bt_player_id"], name: "index_battles_on_bt_player_id"
    t.index ["challenge_id"], name: "index_battles_on_challenge_id"
    t.index ["player_id"], name: "index_battles_on_player_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.integer "level", default: 1
    t.integer "prestige", default: 0
    t.integer "next_prestige", default: 10
    t.integer "shards", default: 0
    t.string "card_type"
    t.string "side"
    t.string "cat", default: "normal weak"
    t.integer "hit_points"
    t.integer "armor"
    t.integer "power"
    t.integer "speed"
    t.integer "war_power", default: 0
    t.integer "experience", default: 0
    t.integer "next_level", default: 50
    t.integer "experience_given", default: 30
    t.boolean "unlocked", default: false
    t.integer "skillset"
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_cards_on_player_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "category"
    t.boolean "unlocked", default: false
    t.boolean "done", default: false
    t.integer "rank"
    t.string "shards"
    t.integer "reward"
    t.bigint "player_id", null: false
    t.bigint "computer_id", null: false
    t.string "requirement", default: "none"
    t.string "epic_card", default: "none"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computer_id"], name: "index_challenges_on_computer_id"
    t.index ["player_id"], name: "index_challenges_on_player_id"
  end

  create_table "effects", force: :cascade do |t|
    t.string "name"
    t.integer "duration", default: 1
    t.integer "counter", default: 0
    t.string "effect_type"
    t.integer "intensity", default: 0
    t.boolean "curse", default: false
    t.bigint "battle_card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_card_id"], name: "index_effects_on_battle_card_id"
  end

  create_table "gear_sets", force: :cascade do |t|
    t.integer "level", default: 0
    t.boolean "full", default: false
    t.bigint "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_gear_sets_on_card_id"
  end

  create_table "gears", force: :cascade do |t|
    t.integer "level"
    t.string "gear_type"
    t.integer "bonus_armor", default: 0
    t.integer "bonus_power", default: 0
    t.integer "bonus_speed", default: 0
    t.integer "coins_value"
    t.boolean "used", default: false
    t.bigint "player_id"
    t.bigint "gear_set_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gear_set_id"], name: "index_gears_on_gear_set_id"
    t.index ["player_id"], name: "index_gears_on_player_id"
  end

  create_table "offers", force: :cascade do |t|
    t.boolean "bought", default: false
    t.integer "price"
    t.string "shard_card"
    t.integer "shard_number"
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_offers_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.string "code"
    t.integer "coins", default: 0
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "pvp_battle_cards", force: :cascade do |t|
    t.boolean "dead", default: false
    t.integer "counter", default: 0
    t.integer "hit_points"
    t.integer "armor"
    t.integer "power"
    t.integer "speed"
    t.integer "max_hp"
    t.integer "damage_taken", default: 0
    t.bigint "card_id", null: false
    t.bigint "pvp_battle_team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_pvp_battle_cards_on_card_id"
    t.index ["pvp_battle_team_id"], name: "index_pvp_battle_cards_on_pvp_battle_team_id"
  end

  create_table "pvp_battle_teams", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.integer "code"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_pvp_battle_teams_on_player_id"
  end

  create_table "pvp_battles", force: :cascade do |t|
    t.string "result"
    t.bigint "player_id", null: false
    t.bigint "bt_opponent_id", null: false
    t.bigint "bt_player_id", null: false
    t.integer "turn_number", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bt_opponent_id"], name: "index_pvp_battles_on_bt_opponent_id"
    t.index ["bt_player_id"], name: "index_pvp_battles_on_bt_player_id"
    t.index ["player_id"], name: "index_pvp_battles_on_player_id"
  end

  create_table "pvp_effects", force: :cascade do |t|
    t.string "name"
    t.integer "duration", default: 1
    t.integer "counter", default: 0
    t.string "effect_type"
    t.integer "intensity", default: 0
    t.string "curse", default: "f"
    t.bigint "pvp_battle_card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pvp_battle_card_id"], name: "index_pvp_effects_on_pvp_battle_card_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "level", default: 1
    t.string "target_type"
    t.string "strength"
    t.integer "reload_time"
    t.integer "counter", default: 0
    t.boolean "effect", default: false
    t.string "effect_target_type"
    t.string "effect_type"
    t.boolean "curse", default: false
    t.integer "effect_duration", default: 1
    t.integer "intensity"
    t.bigint "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_skills_on_card_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", default: "New Player"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "battle_cards", "battle_teams"
  add_foreign_key "battle_cards", "cards"
  add_foreign_key "battle_teams", "players"
  add_foreign_key "battles", "battle_teams", column: "bt_computer_id"
  add_foreign_key "battles", "battle_teams", column: "bt_player_id"
  add_foreign_key "battles", "challenges"
  add_foreign_key "battles", "players"
  add_foreign_key "cards", "players"
  add_foreign_key "challenges", "players"
  add_foreign_key "challenges", "players", column: "computer_id"
  add_foreign_key "effects", "battle_cards"
  add_foreign_key "gear_sets", "cards"
  add_foreign_key "gears", "gear_sets"
  add_foreign_key "gears", "players"
  add_foreign_key "offers", "players"
  add_foreign_key "players", "users"
  add_foreign_key "pvp_battle_cards", "cards"
  add_foreign_key "pvp_battle_cards", "pvp_battle_teams"
  add_foreign_key "pvp_battle_teams", "players"
  add_foreign_key "pvp_battles", "players"
  add_foreign_key "pvp_battles", "pvp_battle_teams", column: "bt_opponent_id"
  add_foreign_key "pvp_battles", "pvp_battle_teams", column: "bt_player_id"
  add_foreign_key "pvp_effects", "pvp_battle_cards"
  add_foreign_key "skills", "cards"
end
