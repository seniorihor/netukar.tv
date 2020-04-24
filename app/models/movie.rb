class Movie < GalleryItem
  has_many :library_items, foreign_key: 'gallery_item_id', dependent: :destroy
  has_and_belongs_to_many :purchase_options, foreign_key: 'gallery_item_id', dependent: :destroy

  after_save :clear_cache

  def self.fetch_and_cache
    Rails.cache.fetch('movies', expires_in: 12.hours) do
      self.ordered_by_creation.includes(:purchase_options).to_a
    end
  end

  def clear_cache
    Rails.cache.delete('movies')
    Rails.cache.delete('movies_and_seasons')
  end
end
