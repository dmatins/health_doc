class AddFileAttachmentToRecordValues < ActiveRecord::Migration[5.0]
  def up
    add_attachment :record_values, :file
    remove_column :record_values, :file_name
  end

  def down
    remove_attachment :record_values, :file
    add_column :record_values, :file_name
  end
end
