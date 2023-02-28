class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.boolean :bought, default: false
      t.integer :price
      t.string :shard_card
      t.integer :shard_number
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
