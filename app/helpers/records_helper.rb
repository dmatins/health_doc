module RecordsHelper
  def setup_record(object)
    patient, record = object
    if record.record_type
      record.record_type.record_fields.each do |field|
        record.record_values.find_or_initialize_by(record_field: field)
      end
    end
    [patient, record]
  end
end
