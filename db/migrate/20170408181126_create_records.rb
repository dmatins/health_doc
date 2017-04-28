class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.integer :patient_id
      t.integer :record_type_id

      t.timestamps
    end
    add_index :records, :patient_id
    add_index :records, :record_type_id
  end
end
