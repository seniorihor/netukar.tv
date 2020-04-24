module Api::V1
  class SeasonsController < ApplicationController
    # An endpoint to return the seasons ordered by creation, including the list
    # of episodes ordered by its number
    # GET /api/v1/seasons
    def index
      seasons = Season.fetch_and_cache
      render json: seasons
    end
  end
end
