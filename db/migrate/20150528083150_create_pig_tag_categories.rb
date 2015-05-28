class CreatePigTagCategories < ActiveRecord::Migration
  def change
    create_table :pig_tag_categories do |t|
      t.string :name
      t.string :slug
    end
  end
end
