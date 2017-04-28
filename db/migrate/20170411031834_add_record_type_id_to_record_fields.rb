class AddRecordTypeIdToRecordFields < ActiveRecord::Migration[5.0]
  def change
    add_column :record_fields, :record_type_id, :integer
    add_index :record_fields, :record_type_id
  end
end
