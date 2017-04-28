require 'rails_helper'

RSpec.describe Patient, type: :model do
  it "is valid if all of its needed fields are filled out and valid" do
    patient = FactoryGirl.create(:patient)
    expect(patient).to be_valid
  end
  
  it "has a valid first name" do
    patient = FactoryGirl.create(:patient, first_name: nil)
    expect(patient).to_not be_valid
  end
  
  it "has a valid last name" do
    patient = FactoryGirl.create(:patient, last_name: nil)
    expect(patient).to_not be_valid
  end
  
  it "is valid without a middle name" do
    patient = FactoryGirl.create(:patient, middle_name: nil)
    expect(patient).to be_valid
  end
  
  it "has a valid email address of the form [name]@[website].[extension]" do
    patient = FactoryGirl.create(:patient, email: nil)
    expect(patient).to_not be_valid
    patient.email = "email1"
    expect(patient).to_not be_valid
    patient.email = "email1@"
    expect(patient).to_not be_valid
    patient.email = "email1@example"
    expect(patient).to_not be_valid
    patient.email = "email1@example."
    expect(patient).to_not be_valid
  end
  
  it "has a valid zip code consisting only of numeric characters" do
    patient = FactoryGirl.create(:patient, zip: nil)
    expect(patient).to_not be_valid
    patient.zip = "44 55"
    expect(patient).to_not be_valid
    patient.zip = "4455#"
    expect(patient).to_not be_valid
    patient.zip = "a4455"
    expect(patient).to_not be_valid
  end
  
  it "has a valid dob such that they are not born in the future" do
    patient = FactoryGirl.create(:patient, dob: nil)
    expect(patient).to_not be_valid
    patient.dob = Time.now + 5.days
    expect(patient).to_not be_valid
  end
  
  it "has a gender" do
    patient = FactoryGirl.create(:patient, gender: nil)
    expect(patient).to_not be_valid
  end
end