class GalleryItem < ApplicationRecord
  validates :plot, presence: true
  validates :title, presence: true

  scope :ordered_by_creation, -> { order('created_at asc') }
  scope :movie_and_seasons, -> { where(type: %i[Movie Season]) }

  def self.fetch_and_cache
    Rails.cache.fetch('movies_and_seasons', expires_in: 12.hours) do
      movie_and_seasons.ordered_by_creation.includes(:purchase_options).to_a
    end
  end
end
