module Api::V1
  class MoviesAndSeasonsController < ApplicationController
    # An endpoint to return both movies and seasons, ordered by creation
    # GET /api/v1/movies_and_seasons
    def index
      movies_and_seasons = GalleryItem.fetch_and_cache
      render json: movies_and_seasons
    end
  end
end
