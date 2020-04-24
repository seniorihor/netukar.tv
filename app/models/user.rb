class User < ApplicationRecord
  has_many :library_items, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Returns list of active video subscriptions ordered by expiry
  def library
    library_items.active_subscriptions.ordered_by_expiry
  end
end
