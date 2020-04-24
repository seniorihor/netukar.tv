class Episode < GalleryItem
  validates :number, presence: true
  validates_presence_of :season_id, message: 'must be provided.'

  default_scope { order('number asc') }
end
