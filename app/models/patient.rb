# A patient has several medical records, and may be either male or female.

class Patient < ApplicationRecord
  has_many :records
  has_many :presciptions
  has_many :user_patients
  has_many :users, through: :user_patients
  has_many :invoices
  has_many :physicians, ->{ joins(:role).where(roles: { name: "physician" }) }, through: :user_patients, source: :user

  has_paper_trail

  enum gender: [:male, :female, :zim, :sie, :em, :ver, :ter, :xem, :mer, :het, :thon, :hum, :hesh, :nem]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :gender, presence: true
  validates :dob, presence: true

  # Return the full name of the individual.
  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
