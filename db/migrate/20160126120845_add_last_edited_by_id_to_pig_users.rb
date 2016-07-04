class AddLastEditedByIdToPigUsers < ActiveRecord::Migration
  def change
    add_column :pig_content_packages, :last_edited_by_id, :integer
  end
end
