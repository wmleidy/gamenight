class CreateOwnedGames < ActiveRecord::Migration
  def change
    create_table :owned_games do |t|
      t.integer :owner_id, null: false
      t.belongs_to :game, null: false

      t.timestamps null: false
    end
  end
end
