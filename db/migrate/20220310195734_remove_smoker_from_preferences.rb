class RemoveSmokerFromPreferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :preferences, :smoker
  end
end
