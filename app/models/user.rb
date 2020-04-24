class User < ApplicationRecord
  has_many :library_items, dependent: :destroy
end
