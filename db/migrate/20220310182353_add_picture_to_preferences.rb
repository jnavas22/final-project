class AddPictureToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_column :preferences, :picture, :string
  end
end
