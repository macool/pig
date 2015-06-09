class CreateActivityItems < ActiveRecord::Migration
  def change
    create_table :pig_activity_items do |t|
      t.belongs_to :user
      t.belongs_to :resource, :polymorphic => true
      t.belongs_to :parent_resource, :polymorphic => true
      t.string :text
      t.datetime :created_at
    end
    add_index :pig_activity_items, :user_id
    add_index :pig_activity_items, [:resource_type, :resource_id], :name => "resource_index"
    add_index :pig_activity_items, [:parent_resource_type, :parent_resource_id], :name => "parent_resource_index"
  end
end
