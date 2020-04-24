class CreateGalleryItemsPurchaseOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :gallery_items_purchase_options do |t|
      t.integer :gallery_item_id
      t.integer :purchase_option_id

      t.timestamps
    end
  end
end
