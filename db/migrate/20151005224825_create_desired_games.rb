class CreateDesiredGames < ActiveRecord::Migration
  def change
    create_table :desired_games do |t|
      t.integer :wanter_id, null: false
      t.integer :wanted_game_id, null: false

      t.timestamps null: false
    end
  end
end
