FactoryGirl.define do
  factory :appointment do
    patient_id 1
    physician_id 1
    start_time "2017-04-15 14:36:24"
    end_time "2017-04-15 14:36:24"
    record_type_id 1
    name "MyString"
    description "MyText"
  end
end
