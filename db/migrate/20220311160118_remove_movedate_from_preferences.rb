class RemoveMovedateFromPreferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :preferences, :movedate
  end
end
