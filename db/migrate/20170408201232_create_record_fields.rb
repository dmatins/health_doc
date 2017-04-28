class CreateRecordFields < ActiveRecord::Migration[5.0]
  def change
    create_table :record_fields do |t|
      t.string :name
      t.text :allowed_values

      t.timestamps
    end
  end
end
