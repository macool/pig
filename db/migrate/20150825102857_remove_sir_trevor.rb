class RemoveSirTrevor < ActiveRecord::Migration
  def up
    remove_column :pig_content_attributes, :sir_trevor_settings
    drop_table :pig_sir_trevor_images
  end

  def down
    add_column :pig_content_attributes, :sir_trevor_settings, :text
    create_table :pig_sir_trevor_images, force: :cascade do |t|
      t.text    :image_uid
      t.text    :sir_trevor_uid
      t.text    :filename
      t.integer :content_package_id
    end
  end
end
