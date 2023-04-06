class CreateGearSets < ActiveRecord::Migration[7.0]
  def change
    create_table :gear_sets do |t|
      t.integer :level, default: 0
      t.integer :bonus_hp, default: 0
      t.integer :bonus_armor, default: 0
      t.integer :bonus_power, default: 0
      t.integer :bonus_speed, default: 0
      t.boolean :full, default: false
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
