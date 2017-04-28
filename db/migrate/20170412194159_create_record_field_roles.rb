class CreateRecordFieldRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :record_field_roles do |t|
      t.integer :record_field_id
      t.integer :role_id
      t.integer :access_type

      t.timestamps
    end
    add_index :record_field_roles, :record_field_id
    add_index :record_field_roles, :role_id
    add_index :record_field_roles, :access_type
  end
end
