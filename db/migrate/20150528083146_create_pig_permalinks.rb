class CreatePigPermalinks < ActiveRecord::Migration
  def change
    create_table :pig_permalinks do |t|
      t.string :path
      t.string :full_path
      t.belongs_to :resource, :polymorphic => true
      t.boolean :active, :default => true
      t.timestamps
    end
    add_index :pig_permalinks, :path
    add_index :pig_permalinks, :full_path
  end
end
