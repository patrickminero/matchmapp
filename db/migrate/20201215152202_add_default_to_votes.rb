class AddDefaultToVotes < ActiveRecord::Migration[6.0]
  def change
    change_column :bars, :green_votes, :integer, default: 0, null: 0
    change_column :bars, :green_votes, :integer, default: 0, null: 0
    change_column :bars, :green_votes, :integer, default: 0, null: 0
  end
end
