class LibraryItem < ApplicationRecord
  VALIDITY = 2.days

  belongs_to :user
  belongs_to :gallery_item
  belongs_to :movie, foreign_key: 'gallery_item_id', optional: true
  belongs_to :season, foreign_key: 'gallery_item_id', optional: true
  belongs_to :purchase_option

  validates_presence_of :gallery_item_id, message: 'must be provided.'

  scope :active_subscriptions, -> { where('expires_at > ?', DateTime.now) }
  scope :ordered_by_expiry, -> { order('expires_at asc') }

  class << self

    # Create new library item if not present
    def search_or_create(purchase_params)
      items = search_item(purchase_params)
      if items.any?
        still_valid_purchase = expires_in(items)
        return still_valid_purchase if still_valid_purchase
      end
      create_item(purchase_params)
    end

    private

    def create_item(purchase_params)
      purchase_params[:expires_at] = Time.now + VALIDITY
      library_item = LibraryItem.create(purchase_params)
      error_messages = library_item.errors.full_messages
      return { status: 404, messages: error_messages } if error_messages.any?

      { message: 'Purchase successful.' }
    end

    def search_item(purchase_params)
      where(purchase_params)
    end

    def expires_in(items)
      expiry_time = items.last.expires_at.to_i
      current_time = DateTime.now.to_i
      return if current_time > expiry_time

      message = ActiveSupport::Duration.build(expiry_time - current_time).parts
      duration = ''
      duration += "#{message[:days]} days" if message[:days].positive?
      duration += " #{message[:hours]} hours" if message[:hours].positive?
      { message: "You still have a valid subscription for #{duration}." }
    end

  end
end
