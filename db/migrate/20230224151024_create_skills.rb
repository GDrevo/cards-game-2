class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :target_type
      t.string :strength
      t.integer :reload_time
      t.integer :counter, default: 0
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
