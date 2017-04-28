class AddInsuranceInfoToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :insurance, :string
    add_column :patients, :group_num, :string
    add_column :patients, :id_num, :string
  end
end
