class AddDateValueToRecordValues < ActiveRecord::Migration[5.0]
  def change
    add_column :record_values, :date_value, :datetime
  end
end
