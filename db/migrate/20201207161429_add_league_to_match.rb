class AddLeagueToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :league, :string
  end
end
