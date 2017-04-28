json.extract! patient, :id, :first_name, :middle_name, :last_name, :email, :street, :city, :state, :dob, :created_at, :updated_at
json.url patient_url(patient, format: :json)
