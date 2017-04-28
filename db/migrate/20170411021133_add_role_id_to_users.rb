class AddRoleIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role_id, :integer
    add_index :users, :role_id

    remove_column :users, :role
  end
end
