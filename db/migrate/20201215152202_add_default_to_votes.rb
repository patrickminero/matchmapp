class AddDefaultToVotes < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bars, :green_votes, 0, 0
    change_column_default :bars, :yellow_votes, 0, 0
    change_column_default :bars, :red_votes, 0, 0
  end
end
