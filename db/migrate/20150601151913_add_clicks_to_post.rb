class AddClicksToPost < ActiveRecord::Migration
  def change
    add_column :posts, :clicks, :integer
  end
end
