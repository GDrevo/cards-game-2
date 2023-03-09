class CreatePvpBattles < ActiveRecord::Migration[7.0]
  def change
    create_table :pvp_battles do |t|
      t.string :result
      t.references :player, null: false, foreign_key: true
      t.references :bt_opponent, null: false
      t.references :bt_player, null: false
      t.integer :turn_number, default: 1

      t.timestamps
    end
    add_foreign_key :pvp_battles, :pvp_battle_teams, column: :bt_opponent_id
    add_foreign_key :pvp_battles, :pvp_battle_teams, column: :bt_player_id
  end
end
