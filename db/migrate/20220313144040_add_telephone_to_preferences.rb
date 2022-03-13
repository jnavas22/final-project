class AddTelephoneToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_column :preferences, :telephone, :string
  end
end
