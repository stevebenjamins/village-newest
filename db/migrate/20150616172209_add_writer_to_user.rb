class AddWriterToUser < ActiveRecord::Migration
  def change
    add_column :users, :writer, :boolean
  end
end
