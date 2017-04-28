class CreateRecordValues < ActiveRecord::Migration[5.0]
  def change
    create_table :record_values do |t|
      t.integer :record_id
      t.integer :record_field_id
      t.string :value
      t.boolean :bool_value
      t.string :file_name

      t.timestamps
    end
    add_index :record_values, :record_id
  end
end
