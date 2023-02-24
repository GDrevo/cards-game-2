class CreateBattles < ActiveRecord::Migration[7.0]
  def change
    create_table :battles do |t|
      t.string :result
      t.references :player, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.references :bt_computer, null: false
      t.references :bt_player, null: false

      t.timestamps
    end
    add_foreign_key :battles, :battle_teams, column: :bt_computer_id
    add_foreign_key :battles, :battle_teams, column: :bt_player_id
  end
end
