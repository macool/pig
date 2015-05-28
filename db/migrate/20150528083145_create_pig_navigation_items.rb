class CreatePigNavigationItems < ActiveRecord::Migration
  def change
    create_table :pig_navigation_items do |t|
      t.belongs_to :parent
      t.integer :position, :default => 0
      t.string :item_type
      t.string :title
      t.text :description
      t.string :image_uid
      t.string :logo_uid
      t.string :resource_type
      t.integer :resource_id
      t.text :url
      t.timestamps
    end
    add_index :pig_navigation_items, :parent_id
  end
end
