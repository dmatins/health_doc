class AddTimeToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :administered_at, :datetime
  end
end
