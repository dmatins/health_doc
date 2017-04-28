class CreateUserPatients < ActiveRecord::Migration[5.0]
  def change
    create_table :user_patients do |t|
      t.integer :user_id
      t.integer :patient_id

      t.timestamps
    end
    add_index :user_patients, :user_id
    add_index :user_patients, :patient_id
  end
end
