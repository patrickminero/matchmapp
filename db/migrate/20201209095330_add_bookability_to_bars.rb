class AddBookabilityToBars < ActiveRecord::Migration[6.0]
  def change
    add_column :bars, :bookable, :boolean, :default => :false
  end
end
