class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.text :description
      t.integer :min_players
      t.integer :max_players
      t.integer :average_time
      t.string :image_url, null: false

      t.timestamps null: false
    end
  end
end
