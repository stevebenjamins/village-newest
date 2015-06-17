class AddMonthToOutdoorMovie < ActiveRecord::Migration
  def change
    add_column :outdoor_movies, :month, :string
  end
end
