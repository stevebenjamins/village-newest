class CreateOutdoorMovies < ActiveRecord::Migration
  def change
    create_table :outdoor_movies do |t|
      t.date :date
      t.string :movie
      t.string :location
      t.string :festival
      t.text :url

      t.timestamps
    end
  end
end
