module Api::V1
  class MoviesController < ApplicationController
    # An endpoint to return the movies, ordered by creation
    # GET /api/v1/movies
    def index
      movies = Movie.fetch_and_cache
      render json: movies
    end
  end
end
