require 'csv'

task :outdoor_movies => [:environment] do

  file = "db/outdoor-movies.csv"
  OutdoorMovie.destroy_all

  CSV.foreach(file, :headers => true) do |row|
    movie = OutdoorMovie.new 
    one = row[0]
    movie_day = one.sub '15', '2015'
    puts movie_day.to_date
    movie.date = movie_day.to_date
    movie.movie = row[1]
    movie.location = row[2]
    movie.festival = row[3]
    movie.url = row[4]
    movie.month = row[5]
    movie.save
    puts "Saved"
  end

end