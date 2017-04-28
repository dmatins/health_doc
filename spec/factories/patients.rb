FactoryGirl.define do
  factory :patient do
    first_name "John"
    middle_name "Doe"
    last_name "Smith"
    email { "#{first_name}#{last_name}.@example.org" }
    street "123 4th St"
    city "Albuquerque"
    state "New Mexico"
    dob "2017-04-08"
    gender :male
  end
end
