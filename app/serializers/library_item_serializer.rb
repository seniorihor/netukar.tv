class LibraryItemSerializer < ActiveModel::Serializer
  attributes :item_id, :title, :expires_at

  def item_id
    object.gallery_item.id
  end

  def title
    object.gallery_item.title
  end
end
