class AddPositionToRecordFields < ActiveRecord::Migration[5.0]
  def change
    add_column :record_fields, :position, :integer
  end
end
