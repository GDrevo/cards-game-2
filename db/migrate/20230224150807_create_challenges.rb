class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :category
      t.boolean :unlocked, default: false
      t.boolean :done, default: false
      t.integer :rank
      t.string :shards
      t.integer :reward
      t.references :player, null: false
      t.references :computer, null: false

      t.timestamps
    end
    add_foreign_key :challenges, :players, column: :player_id
    add_foreign_key :challenges, :players, column: :computer_id
  end
end
