class CreatePvpEffects < ActiveRecord::Migration[7.0]
  def change
    create_table :pvp_effects do |t|
      t.string :name
      t.integer :duration, default: 1
      t.integer :counter, default: 0
      t.string :effect_type
      t.integer :intensity, default: 0
      t.string :curse, default: false
      t.references :pvp_battle_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
