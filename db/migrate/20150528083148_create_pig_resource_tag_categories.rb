class CreatePigResourceTagCategories < ActiveRecord::Migration
  def change
    create_table :pig_resource_tag_categories do |t|
      t.references :tag_category, index: true
      t.references :taggable_resource, polymorphic: true
    end
    add_index :pig_resource_tag_categories, :taggable_resource_id
    add_index :pig_resource_tag_categories, [:taggable_resource_id, :taggable_resource_type], name: 'index_resource_id_and_type'
  end
end
