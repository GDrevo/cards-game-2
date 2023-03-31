class CreateGears < ActiveRecord::Migration[7.0]
  def change
    create_table :gears do |t|
      t.integer :level
      t.string :gear_type
      t.integer :bonus_armor, default: 0
      t.integer :bonus_power, default: 0
      t.integer :bonus_speed, default: 0
      t.integer :coins_value
      t.boolean :used, default: false
      t.references :player, foreign_key: true
      t.references :gear_set, foreign_key: true

      t.timestamps
    end
  end
end
