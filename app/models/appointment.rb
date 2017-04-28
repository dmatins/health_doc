# An appointment is associated with up to one patient and up to one physician (here, a physician is a user for
# which the associated role's name attribute is "physician").

class Appointment < ApplicationRecord
  belongs_to :patient, optional: true
  belongs_to :physician, -> { includes(:role).where(roles: {name: "physician"}) }, class_name: User, optional: true
  belongs_to :record_type

  validates :patient, presence: true
  validates :physician, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :record_type, presence: true

  def self.between_dates(start_time, end_time)
    a = arel_table
    where(a[:start_time].gteq(start_time).or(a[:end_time].gteq(start_time))).where(a[:start_time].lteq(end_time).or(a[:end_time].lteq(end_time)))
  end
end
