class AddTotalSeatsToBars < ActiveRecord::Migration[6.0]
  def change
    add_column :bars, :total_seats, :integer
  end
end
