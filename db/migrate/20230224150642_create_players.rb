class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :code
      t.integer :coins, default: 0
      t.integer :rank

      t.timestamps
    end
  end
end
