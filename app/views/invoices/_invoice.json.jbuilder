json.extract! invoice, :id, :patient_id, :service_date, :is_billed, :billed_date, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
