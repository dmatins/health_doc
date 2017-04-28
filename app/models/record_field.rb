# A record field is a field contained in all records of a particular type.  Only users with certain
# specified roles may view or edit this field in the main view.

class RecordField < ApplicationRecord

  belongs_to :record_type, inverse_of: :record_fields
  has_many :view_record_field_roles, -> { where(access_type: :view) }, class_name: RecordFieldRole
  has_many :edit_record_field_roles, -> { where(access_type: :edit) }, class_name: RecordFieldRole
  has_many :view_roles, through: :view_record_field_roles, source: :role
  has_many :edit_roles, through: :edit_record_field_roles, source: :role

  serialize :allowed_values, Array

  enum field_type: [:string, :text, :file, :select_box, :checkbox, :date, :date_time]

  before_create :set_position, if: Proc.new{|field| field.sort.blank?}

  default_scope {order(:sort)}

  # Return the array of role names which have read permission for this particular field.
  def view_role_names
    view_roles.pluck(:name)
  end

  # Set the roles which have permission to view this particular field.
  # @param: roles: The array of role names to be given permission to view this field.
  def view_role_names=(roles)
    self.view_roles = Role.where(name: roles)
  end

  # Return the array of role names which have write permission for this particular field.
  def edit_role_names
    edit_roles.pluck(:name)
  end

  # Set the roles which have permission to edit this field.
  # @param: roles: The array of role names to be given write permission for this field.
  def edit_role_names=(roles)
    self.edit_roles = Role.where(name: roles)
  end

  # Return whether or not a user has view permission for this field.
  # @param: user: The user whose permissions are to be checked.
  def can_view?(user)
    return true if user.admin?
    view_roles.include?(user.role)
  end

  # Return whether or not a user has edit permission for this field.
  # @param: user: The user whose permissions are to be checked.
  def can_edit?(user)
    return true if user.admin?
    edit_roles.include?(user.role)
  end

  private

    # Give this field the next available position number in the overarching
    # record type.
    def set_position
      return 1 if record_type.record_fields.empty?
      self.sort = record_type.record_fields.map(&:sort).map(&:to_i).max + 1
    end
end
