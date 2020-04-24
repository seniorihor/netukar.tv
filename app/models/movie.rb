class Movie < GalleryItem
  has_many :library_items, foreign_key: 'gallery_item_id', dependent: :destroy
  has_and_belongs_to_many :purchase_options, foreign_key: 'gallery_item_id', dependent: :destroy
end
