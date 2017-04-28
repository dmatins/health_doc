# A record is associated with a type of medical record (which determines
# the fields that can be filled out for this particular record) and
# multiple record values holding the information for the associated fields.
# Any changes to records are tracked, and the "updated_at" attribute reflects
# the last time a record value was added to a particular record.

class Record < ApplicationRecord
  belongs_to :patient
  belongs_to :record_type
  has_many :record_values, inverse_of: :record, autosave: true, dependent: :destroy
  belongs_to :invoice, optional: true

  has_paper_trail

  accepts_nested_attributes_for :record_values
  
  validates :record_type, presence: true
  validates :administered_at, presence: true
end
