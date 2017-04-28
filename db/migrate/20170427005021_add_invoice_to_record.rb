class AddInvoiceToRecord < ActiveRecord::Migration[5.0]
  def change
    add_reference :records, :invoice, foreign_key: true
  end
end
