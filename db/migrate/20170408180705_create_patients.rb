class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :street
      t.string :city
      t.string :state
      t.date :dob

      t.timestamps
    end
  end
end
