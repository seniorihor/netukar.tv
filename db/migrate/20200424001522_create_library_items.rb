class CreateLibraryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :library_items do |t|
      t.integer :user_id
      t.integer :gallery_item_id
      t.integer :purchase_option_id
      t.datetime :expires_at

      t.timestamps
    end
  end
end
