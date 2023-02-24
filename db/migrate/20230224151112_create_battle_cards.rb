class CreateBattleCards < ActiveRecord::Migration[7.0]
  def change
    create_table :battle_cards do |t|
      t.boolean :dead, default: false
      t.integer :counter, default: 0
      t.integer :hit_points
      t.references :card, null: false, foreign_key: true
      t.references :battle_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
