# Each record type contains a particular configuration of record fields in which
# data will be entered.

class RecordType < ApplicationRecord
  has_many :record_fields, inverse_of: :record_type

  accepts_nested_attributes_for :record_fields

  validates :name, presence: true
  validates :description, presence: true
end
