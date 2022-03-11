class AddMovedateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :movedate, :date
  end
end
