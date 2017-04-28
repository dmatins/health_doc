class Presciption < ApplicationRecord
  belongs_to :patient
  belongs_to :physician, class_name: User 

  has_paper_trail

  validates :patient, presence: true
  validates :physician, presence: true
  validates :medication, presence: true
end
