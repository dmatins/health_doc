class RemoveTimeFromInvoice < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :service_date, :datetime
  end
end
