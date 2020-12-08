class AddSportsToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :sports, :string
  end
end
