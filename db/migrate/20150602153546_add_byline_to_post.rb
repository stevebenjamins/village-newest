class AddBylineToPost < ActiveRecord::Migration
  def change
    add_column :posts, :byline, :text
  end
end
