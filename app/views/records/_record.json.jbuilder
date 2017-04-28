json.extract! record, :id, :patient_id, :record_type_id, :created_at, :updated_at
json.url patient_record_url(@patient, record, format: :json)

record.record_values.each do |value|
  json.set! value.record_field.name, value.show_value
end
