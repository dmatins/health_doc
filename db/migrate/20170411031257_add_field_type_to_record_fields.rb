class AddFieldTypeToRecordFields < ActiveRecord::Migration[5.0]
  def change
    add_column :record_fields, :field_type, :integer
    add_index :record_fields, :field_type
  end
end
