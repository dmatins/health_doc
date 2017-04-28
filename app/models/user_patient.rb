class UserPatient < ApplicationRecord
  belongs_to :user, inverse_of: :user_patients
  belongs_to :patient, inverse_of: :user_patients
end
