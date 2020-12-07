class CreateScreenings < ActiveRecord::Migration[6.0]
  def change
    create_table :screenings do |t|
      t.references :match, null: false, foreign_key: true
      t.references :bar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
