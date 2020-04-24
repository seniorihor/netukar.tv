module Api::V1
  class UsersController < ApplicationController
    # Creates a user with email in a system
    # POST /api/v1/users
    def create
      user = User.create(user_params)
      render json: user
    end

    # Returns list of users
    # GET /api/v1/users
    def index
      render json: User.all
    end

    private

    def user_params
      params.require(:user).permit(:email)
    end
  end
end
