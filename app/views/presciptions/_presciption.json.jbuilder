json.extract! presciption, :id, :patient_id, :physician_id, :medication, :quantity, :issue_date, :expiration_date, :renew_count, :called_in, :created_at, :updated_at
json.url presciption_url(presciption, format: :json)
