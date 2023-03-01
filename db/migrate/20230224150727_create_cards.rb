class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :level, default: 1
      t.integer :prestige, default: 0
      t.integer :next_prestige, default: 10
      t.integer :shards, default: 0
      t.string :card_type
      t.string :side
      t.string :cat
      t.integer :hit_points
      t.integer :armor
      t.integer :power
      t.integer :speed
      t.integer :war_power, default: 0
      t.integer :experience, default: 0
      t.integer :next_level, default: 50
      t.integer :experience_given, default: 30
      t.boolean :unlocked, default: false
      t.integer :skillset
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
