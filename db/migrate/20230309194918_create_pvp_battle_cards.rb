class CreatePvpBattleCards < ActiveRecord::Migration[7.0]
  def change
    create_table :pvp_battle_cards do |t|
      t.boolean :dead, default: false
      t.integer :counter, default: 0
      t.integer :hit_points
      t.integer :armor
      t.integer :power
      t.integer :speed
      t.integer :max_hp
      t.integer :damage_taken, default: 0
      t.references :card, null: false, foreign_key: true
      t.references :pvp_battle_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
