class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :physician_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :record_type_id
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :appointments, :patient_id
    add_index :appointments, :physician_id
    add_index :appointments, :record_type_id
  end
end
