class CreatePurchaseOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_options do |t|
      t.float :price
      t.string :video_quality

      t.timestamps
    end
  end
end
