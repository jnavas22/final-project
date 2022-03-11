class AddIndustryToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_column :preferences, :industry, :string
  end
end
