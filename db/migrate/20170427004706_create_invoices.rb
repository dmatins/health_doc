class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.references :patient, foreign_key: true
      t.datetime :service_date
      t.boolean :is_billed
      t.datetime :billed_date

      t.timestamps
    end
  end
end
