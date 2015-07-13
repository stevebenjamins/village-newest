class PagesController < ApplicationController
  
  def movies
    @body_class = "movies-body"
    @june_movies = OutdoorMovie.where("month = ?", 'June').order('date ASC')
    @july_movies = OutdoorMovie.where("month = ?", 'July').order('date ASC')
    @august_movies = OutdoorMovie.where("month = ?", 'August').order('date ASC')
      @september_movies = OutdoorMovie.where("month = ?", 'September').order('date ASC')
    @movies = OutdoorMovie.order('date ASC')
    @title = "Outdoor movies playing in Toronto 2015"
    @facebook_image = "http://www.itsonvillage.com/" + ActionController::Base.helpers.asset_path('facebook-image-movies.jpg')
    @facebook_description = "Every outdoor movie playing in Toronto this summer. From 8 different festivals."
  end
  
  def brief
    @body_class = "brief-body" 
  end 

end
