class PurchaseOption < ApplicationRecord
  has_and_belongs_to_many :gallery_items, dependent: :destroy

  validates :price, :video_quality, presence: true
end
