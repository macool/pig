class CreatePigRedactorUploads < ActiveRecord::Migration
  def change
    create_table :pig_redactor_image_uploads do |t|
      t.string :file_uid
      t.string :file_type
      t.timestamps
    end
  end
end
