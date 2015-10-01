class RenameContentPackagesDeletedAtToArchivedAt < ActiveRecord::Migration
  def change
    rename_column :pig_content_packages, :deleted_at, :archived_at
  end
end
