class CreatePvpBattleTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :pvp_battle_teams do |t|
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
