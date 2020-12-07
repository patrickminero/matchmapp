class CreateBars < ActiveRecord::Migration[6.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.text :description
      t.integer :status, default: 0
      t.integer :category
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
