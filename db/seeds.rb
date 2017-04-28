# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create singleton users and their roles
%w(admin secretary accountant user).each do |type|
  role = Role.find_or_create_by(name: type)
  user = User.find_or_create_by!(email: "#{type}@example.com") do |user|
    user.name = type
    user.street = Faker::Address.street_address
    user.city = Faker::Address.city
    user.state = Faker::Address.state
    user.zip = Faker::Address.zip_code
    user.dob = Date.new((1920..2016).to_a.sample,(1..12).to_a.sample,(1..28).to_a.sample)
    user.hire_date = Date.new((2005..2016).to_a.sample,(1..12).to_a.sample,(1..28).to_a.sample)
    user.password = "password"
    user.password_confirmation = "password"
    user.confirm
    user.update(role: role)
  end
  puts "CREATED #{type} USER: " << user.email
end

# Create multiple users for other roles
%w(physician nurse).each do |type|
  role = Role.find_or_create_by(name: type)
  for i in 1..5
    username = "#{type}#{i}"
    user = User.find_or_create_by!(email: "#{username}@example.com") do |user|
      user.name = username
      user.street = Faker::Address.street_address
      user.city = Faker::Address.city
      user.state = Faker::Address.state
      user.zip = Faker::Address.zip_code
      user.dob = Date.new((1920..2016).to_a.sample,(1..12).to_a.sample,(1..28).to_a.sample)
      user.hire_date = Date.new((2005..2016).to_a.sample,(1..12).to_a.sample,(1..28).to_a.sample)
      user.password = "password"
      user.password_confirmation = "password"
      user.confirm
      user.update(role: role)
    end
    puts "CREATED #{username} USER: " << user.email
  end
end

50.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  pat = Patient.find_or_create_by!(email: "#{first}#{last}@example.com") do |pat|
    pat.first_name = first
    pat.last_name = last
    pat.middle_name = "#{('A'..'Z').to_a.sample}."
    pat.gender = Patient.genders.keys.sample
    pat.street = Faker::Address.street_address
    pat.city = Faker::Address.city
    pat.state = Faker::Address.state
    pat.zip = Faker::Address.zip_code
    pat.dob = Date.new((1920..2016).to_a.sample,(1..12).to_a.sample,(1..28).to_a.sample)
    pat.insurance = "Obummercare (ACA)"
    pat.group_num = rand(36**8).to_s(36)
    pat.id_num = rand(36**15).to_s(36) 
  end
  puts "CREATED #{pat.first_name} #{pat.last_name} USER: " << pat.email
end

secretary = User.secretaries.first
nurses = User.nurses
Patient.find_each do |patient|
  next if patient.physicians.any?
  (rand(3) + 1).times do |i|
    patient.physicians << User.physicians.sample
    patient.users << nurses.sample
  end
  patient.users << secretary
  patient.save
end

# Create checkup record type
checkUprt = RecordType.find_or_create_by(name: "Checkup", description: "General Checkup")
checkUprt.record_fields.find_or_create_by(name: "Reason", field_type: :string) do |field|
  field.view_role_names = %w(physician nurse secretary user)
  field.edit_role_names = %w(physician nurse)
end
checkUprt.record_fields.find_or_create_by(name: "Blood Pressure", field_type: :string) do |field|
  field.view_role_names = %w(physician nurse user)
  field.edit_role_names = %w(physician nurse)
end
checkUprt.record_fields.find_or_create_by(name: "Heart Rate", field_type: :string) do |field|
  field.view_role_names = %w(physician nurse user)
  field.edit_role_names = %w(physician nurse)
end
checkUprt.record_fields.find_or_create_by(name: "Procedure", field_type: :select_box) do |field|
  field.allowed_values = ["Procedure 1", "Procedure 2", "Procedure 3"]
  field.view_role_names = %w(physician nurse secretary user)
  field.edit_role_names = %w(physician)
end
checkUprt.record_fields.find_or_create_by(name: "Notes", field_type: :text) do |field|
  field.view_role_names = %w(physician nurse)
  field.edit_role_names = %w(physician)
end

# Create xray record type
xRayrt = RecordType.find_or_create_by(name: "X-Ray", description: "X-Ray")
xRayrt.record_fields.find_or_create_by(name: "Reason", field_type: :string) do |field|
  field.view_role_names = %w(physician nurse secretary user)
  field.edit_role_names = %w(physician nurse)
end
xRayrt.record_fields.find_or_create_by(name: "Notes", field_type: :text) do |field|
  field.view_role_names = %w(physician nurse)
  field.edit_role_names = %w(physician)
end

# Create ctScan record type
ctScanrt = RecordType.find_or_create_by(name: "CT Scan", description: "A computed tomography (CT) scan")
ctScanrt.record_fields.find_or_create_by(name: "Reason", field_type: :string) do |field|
  field.view_role_names = %w(physician nurse secretary user)
  field.edit_role_names = %w(physician nurse)
end
ctScanrt.record_fields.find_or_create_by(name: "Notes", field_type: :text) do |field|
  field.view_role_names = %w(physician nurse)
  field.edit_role_names = %w(physician)
end

# Create mri record type
mrirt = RecordType.find_or_create_by(name: "MRI", description: "Magnetic resonance imaging (MRI)")
mrirt.record_fields.find_or_create_by(name: "Reason", field_type: :string) do |field|
  field.view_role_names = %w(physician nurse secretary user)
  field.edit_role_names = %w(physician nurse)
end
mrirt.record_fields.find_or_create_by(name: "Notes", field_type: :text) do |field|
  field.view_role_names = %w(physician nurse)
  field.edit_role_names = %w(physician)
end

# Create bloodtest record type
bloodtestrt = RecordType.find_or_create_by(name: "Blood Test", description: "A General blood test")
bloodtestrt.record_fields.find_or_create_by(name: "Procedure", field_type: :select_box) do |field|
  field.allowed_values = ["Complete Blood Count", "Fibrinogen", "Hemoglobin A1C", "DHEA", "Prostate-Specific Antigen", "Homocysteine", "C-Reactive Protein", "Thyroid Stimulating Hormone", "Testosterone", "Estradiol", "Drug", "Other"]
  field.view_role_names = %w(physician nurse user)
  field.edit_role_names = %w(physician)
end
bloodtestrt.record_fields.find_or_create_by(name: "Reason", field_type: :string) do |field|
  field.view_role_names = %w(physician nurse secretary user)
  field.edit_role_names = %w(physician nurse)
end
bloodtestrt.record_fields.find_or_create_by(name: "Notes", field_type: :text) do |field|
  field.view_role_names = %w(physician nurse)
  field.edit_role_names = %w(physician)
end

# Create urineTest record type
urineTestrt = RecordType.find_or_create_by(name: "Urine Test", description: "A General urine test")
urineTestrt.record_fields.find_or_create_by(name: "Procedure", field_type: :select_box) do |field|
  field.allowed_values = ["Drug", "Diabetes", "UTI", "Kidney Stone", "Hypertension", "Other"]
  field.view_role_names = %w(physician nurse user)
  field.edit_role_names = %w(physician)
end
urineTestrt.record_fields.find_or_create_by(name: "Reason", field_type: :string) do |field|
  field.view_role_names = %w(physician nurse secretary user)
  field.edit_role_names = %w(physician nurse)
end
urineTestrt.record_fields.find_or_create_by(name: "Notes", field_type: :text) do |field|
  field.view_role_names = %w(physician nurse)
  field.edit_role_names = %w(physician)
end

# Create appointments 
for j in 1..80
  pat = Patient.all.to_a.sample
  phys = User.joins(:role).where('roles.name' => 'physician').to_a.sample
  startTime = DateTime.new(2017,(3..5).to_a.sample,(1..28).to_a.sample,(0..23).to_a.sample,(0..59).to_a.sample,(0..59).to_a.sample)
  endTime = startTime + Time.parse("1:30").seconds_since_midnight.seconds
  appnt = Appointment.find_or_create_by!(patient: pat, physician: phys, start_time: startTime) do |appnt|
    appnt.end_time = endTime
    appnt.record_type_id = RecordType.pluck(:id).to_a.sample
    appnt.name = "Patient #{pat.full_name} Appointment"
    appnt.description = "Description for appointment #{j}, with physician #{phys.name} and patient #{pat.full_name}."
  end
end

# Create presciptions 
for j in 1..80
  patId = Patient.pluck(:id).to_a.sample
  physId = User.select('users.id').joins(:role).where('roles.name' => 'physician').to_a.sample.id
  issueDate = DateTime.new(2017,(1..6).to_a.sample,(1..28).to_a.sample,(0..23).to_a.sample,(0..59).to_a.sample,(0..59).to_a.sample)
  expirationDate = DateTime.new(2017,(7..12).to_a.sample,(1..28).to_a.sample,(0..23).to_a.sample,(0..59).to_a.sample,(0..59).to_a.sample)
  presciption = Presciption.find_or_create_by!(patient_id: patId, physician_id: physId, issue_date: issueDate) do |presciption|
    presciption.expiration_date = expirationDate
    presciption.medication = ["Lipitor", "Nexium", "Plavix", "Advair Diskus", "Abilify", "Humira", "Crestor","Enbrel", "Remicade", "Cymbalta", "Copaxone", "Neulasta", "Lantus Solostar", "Rituxan"].sample
    presciption.quantity = (1..60).to_a.sample
    presciption.renew_count = (1..3).to_a.sample
    presciption.called_in = false
  end
end

# Create records 
for j in 1..80
  pat = Patient.all.to_a.sample
  recordType = RecordType.all.to_a.sample
  record = Record.find_or_create_by!(patient_id: pat.id, record_type_id: recordType.id) do |record|
    record.administered_at = Time.now
  end
  recordType.record_fields.each do |rField|
    rValue = record.record_values.find_or_create_by!(record_field_id: rField.id) do |val|
      if rField.string? || rField.text?
        val.value = Faker::StarWars.quote
      elsif rField.select_box?
        val.value = rField.allowed_values.sample
      elsif rField.checkbox?
        val.bool_val = [true, false].sample
      elsif rField.file?
        #TODO
      elsif rField.date? || rField.date_time?
        val.date_value = DateTime.new(2017,(1..12).to_a.sample,(1..28).to_a.sample,(0..23).to_a.sample,(0..59).to_a.sample,(0..59).to_a.sample)
      end
    end
  end
end

