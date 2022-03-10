class AddCleanToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_column :preferences, :clean, :integer
  end
end
