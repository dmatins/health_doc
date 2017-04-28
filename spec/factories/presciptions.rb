FactoryGirl.define do
  factory :presciption do
    patient_id 1
    physician_id 1
    medication "MyString"
    quantity 1
    issue_date "2017-04-24 21:10:42"
    expiration_date "2017-04-24 21:10:42"
    renew_count 1
    called_in false
  end
end
