class CreateMechanics < ActiveRecord::Migration
  def change
    create_table :mechanics do |t|
      t.string :trait, null: false
    end
  end
end
