module Api::V1
  class PurchasesController < ApplicationController
    # An endpoint for a user to perform a purchase of a content
    # POST /api/v1/purchases
    def create
      message = LibraryItem.search_or_create(purchase_params)
      render json: message
    end

    private

    def purchase_params
      params.require(:purchase).permit(:user_id, :gallery_item_id, :purchase_option_id)
    end
  end
end
