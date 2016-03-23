class CreatePigContentTypes < ActiveRecord::Migration

  def change
    create_table :pig_content_types do |t|
      t.string :name
      t.text :description
      t.boolean :singleton, :default => false
      t.string :package_name
      t.boolean :viewless, :default => false
      t.string :view_name
    end
  end

end
