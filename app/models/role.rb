# A role is assigned to a user and used to decide which fields in a patient record
# may be viewed and edited by a particular user.

class Role < ApplicationRecord
  has_many :record_field_roles
  has_many :record_fields, through: :record_field_roles

  validates :name, presence: true

  # Return a hash of all roles, with role ids as the keys and role names as the
  # values.
  def self.select_hash
    all.map{|role| {id: role.id, name: role.name}}
  end
end
