class CreatePresciptions < ActiveRecord::Migration[5.0]
  def change
    create_table :presciptions do |t|
      t.integer :patient_id
      t.integer :physician_id
      t.string :medication
      t.integer :quantity
      t.datetime :issue_date
      t.datetime :expiration_date
      t.integer :renew_count
      t.boolean :called_in

      t.timestamps
    end
    add_index :presciptions, :patient_id
    add_index :presciptions, :physician_id
  end
end
