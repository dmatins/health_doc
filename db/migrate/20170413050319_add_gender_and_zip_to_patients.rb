class AddGenderAndZipToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :gender, :integer
    add_index :patients, :gender
    add_column :patients, :zip, :string
  end
end
