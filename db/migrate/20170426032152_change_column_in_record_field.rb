class ChangeColumnInRecordField < ActiveRecord::Migration[5.0]
  def change
    rename_column :record_fields, :position, :sort
  end
end
