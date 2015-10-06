class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, null: false
      t.string :votable_type, null: false
      t.integer :votable_id, null: false
      t.integer :value, null: false, default: 0

      t.timestamps null: false
    end
  end
end
