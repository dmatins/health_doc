json.extract! appointment, :id, :description
json.title appointment.name
json.start appointment.start_time.localtime
json.end appointment.end_time.localtime


#json.url appointment_url(appointment, format: :json)
