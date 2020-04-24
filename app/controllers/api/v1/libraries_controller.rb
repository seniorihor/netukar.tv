module Api::V1
  class LibrariesController < ApplicationController
    # Returns list of alive library items
    # GET /api/v1/users/:id/libraries
    def index
      user = User.find(params[:user_id])
      render json: user.library
    rescue ActiveRecord::RecordNotFound
      render json: { status: 404, error: "User with id #{params[:user_id]} not found" }
    end
  end
end
