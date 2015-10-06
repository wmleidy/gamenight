class CreateGameFeatures < ActiveRecord::Migration
  def change
    create_table :game_features do |t|
      t.belongs_to :game, null: false
      t.belongs_to :mechanic, null: false
    end
  end
end
