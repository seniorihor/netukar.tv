class LibraryItem < ApplicationRecord
  belongs_to :user
  belongs_to :gallery_item
  belongs_to :movie, foreign_key: 'gallery_item_id', optional: true
  belongs_to :season, foreign_key: 'gallery_item_id', optional: true
  belongs_to :purchase_option
end
