class AddUrlToPollItem < ActiveRecord::Migration
  def change
    add_column :poll_items, :url, :string
  end
end
