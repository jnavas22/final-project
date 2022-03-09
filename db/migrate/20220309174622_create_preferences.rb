class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.boolean :pets
      t.integer :max_rent
      t.string :person_type
      t.boolean :laundry
      t.boolean :doorman
      t.integer :roommate_num
      t.boolean :smoker
      t.integer :bathroom_num
      t.boolean :elevator
      t.boolean :transportation
      t.boolean :air_conditioner

      t.timestamps
    end
  end
end
