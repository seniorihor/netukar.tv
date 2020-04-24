class Season < GalleryItem
  has_many :episodes, foreign_key: 'season_id', dependent: :destroy
  has_many :library_items, foreign_key: 'gallery_item_id', dependent: :destroy
  has_and_belongs_to_many :purchase_options, foreign_key: 'gallery_item_id'

  after_save :clear_cache

  def self.fetch_and_cache
    Rails.cache.fetch('seasons_with_episodes', expires_in: 12.hours) do
      self.ordered_by_creation.includes(:episodes, :purchase_options).to_a
    end
  end

  def clear_cache
    Rails.cache.delete('seasons_with_episodes')
    Rails.cache.delete('movies_and_seasons')
  end
end
