class CreateEffects < ActiveRecord::Migration[7.0]
  def change
    create_table :effects do |t|
      t.string :name # Taunt, reduced armor, increased power, speed, damage...
      t.integer :duration, default: 1
      t.integer :counter, default: 0
      t.string :effect_type # taunt, armor, power, speed, damage
      t.integer :intensity, default: 0 # -20>reduced armor, 5>increased speed
      t.references :battle_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
