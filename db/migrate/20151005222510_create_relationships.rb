class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :user, null: false
      t.integer :buddy_id, null: false
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
