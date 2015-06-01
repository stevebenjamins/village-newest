class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :headline
      t.text :url

      t.timestamps
    end
  end
end
