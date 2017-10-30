require 'httparty'
require 'pp'


class MoviesController < ApplicationController

  before_action :authenticate_user!

  def index
    @movies = current_user.movies.map do |movie|
      url = "http://www.omdbapi.com/?i=#{movie.api_id}&apikey=d31f1a94"
      response = HTTParty.get(url)
      response_body = JSON.parse(response.body)

      movie.title = response_body['Title']
      movie.release_year = response_body['Year']
      movie.rating = response_body['Rated']
    end
  end
end
