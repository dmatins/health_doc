class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :dob, :date
    add_column :users, :hire_date, :date
  end
end
