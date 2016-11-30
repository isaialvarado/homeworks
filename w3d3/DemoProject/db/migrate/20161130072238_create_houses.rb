class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address, null: false
      t.integer :person_id
    end
  end
end
