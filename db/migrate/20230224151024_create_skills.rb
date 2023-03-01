class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :level, default: 1
      t.string :target_type
      t.string :strength
      t.integer :reload_time
      t.integer :counter, default: 0
      t.boolean :effect, default: false
      t.string :effect_target_type # same, ennemies, allies, self
      t.string :effect_type # taunt, armor, power, speed, damage, dispell
      t.boolean :curse, default: false # false > Boost, true > Curse
      t.integer :effect_duration, default: 1
      t.integer :intensity
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
