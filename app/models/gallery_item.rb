class GalleryItem < ApplicationRecord
  scope :ordered_by_creation, -> { order('created_at asc') }
end
