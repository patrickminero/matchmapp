class AddUniqueEventIdToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :unique_event_id, :string
  end
end
