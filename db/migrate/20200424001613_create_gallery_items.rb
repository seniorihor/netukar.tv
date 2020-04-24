class CreateGalleryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :gallery_items do |t|
      t.integer :number
      t.string :title
      t.text :plot
      t.string :type
      t.integer :season_id
      t.integer :episode_id

      t.timestamps
    end
  end
end
