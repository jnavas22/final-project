class AddDateToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_column :preferences, :movedate, :date
  end
end
