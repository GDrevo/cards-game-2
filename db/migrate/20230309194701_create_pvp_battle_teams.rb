class CreatePvpBattleTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :pvp_battle_teams do |t|
      t.references :player, null: false, foreign_key: true
      t.integer :code
      t.integer :rank

      t.timestamps
    end
  end
end
