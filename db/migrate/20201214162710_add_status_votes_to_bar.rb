class AddStatusVotesToBar < ActiveRecord::Migration[6.0]
  def change
    add_column :bars, :red_votes, :integer
    add_column :bars, :yellow_votes, :integer
    add_column :bars, :green_votes, :integer
  end
end
