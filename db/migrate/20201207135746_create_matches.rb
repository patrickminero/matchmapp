class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.datetime :date

      t.timestamps
    end
  end
end
