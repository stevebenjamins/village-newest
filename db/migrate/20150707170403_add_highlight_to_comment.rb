class AddHighlightToComment < ActiveRecord::Migration
  def change
    add_column :comments, :highlight, :boolean
  end
end
