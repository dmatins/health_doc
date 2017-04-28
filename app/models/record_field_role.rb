# A record field role denotes the type of access a specific role grants to a specific
# record field - this may be either view (read) or edit (write).

class RecordFieldRole < ApplicationRecord
  belongs_to :record_field, optional: true
  belongs_to :role, optional: true

  enum access_type: [:view, :edit]
end
