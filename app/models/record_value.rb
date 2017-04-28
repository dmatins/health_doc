# A record value holds the information for a particular record field.  Multiple
# record values may be uploaded as a file.

class RecordValue < ApplicationRecord
  belongs_to :record, inverse_of: :record_values, touch: true
  belongs_to :record_field
  has_one :record_type, through: :record_field

  has_paper_trail
  has_attached_file :file

  default_scope { joins(:record_field).order("record_fields.sort ASC") }

  # Return whether a user can view the field containing this value.
  # @param user: The user whose permissions are to be checked.
  def can_view?(user)
    record_field.can_view?(user)
  end

  # Return whether a user can edit the field containing this value.
  # @param user: The user whose permissions are to be checked.
  def can_edit?(user)
    record_field.can_edit?(user)
  end

  def show_value
    if %w(string text select_box).include? record_field.field_type
      value
    elsif record_field.checkbox?
      bool_value ? "Yes" : "No"
    elsif record_field.file? and file.exists?
      {file_file_name => file.url}
    elsif record_field.date?
      date_value.localtime.to_date
    elsif record_field.date_time?
      date_value.localtime
    else
      "Well...you dun goofed"
    end
  end
end
