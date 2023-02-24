class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :level, default: 1
      t.string :card_type
      t.string :side
      t.integer :hit_points
      t.integer :armor
      t.integer :power
      t.integer :speed
      t.integer :experience
      t.integer :next_level
      t.boolean :unlocked
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
