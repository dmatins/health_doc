# Users have a particular role in the system to define their access to
# particular particular parts of patient medical records.

class User < ApplicationRecord
  #enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  belongs_to :role
  delegate :name, to: :role, prefix: true
  has_many :user_patients, inverse_of: :user
  has_many :patients, through: :user_patients
  devise :timeoutable
  # If this user does not yet have a role, set their id to that of the
  # admin, creating a new admin if one does not yet exist.
  def set_default_role
    self.role_id ||= Role.find_or_create_by(name: "user").id
  end

  # Return whether or not this user is an admin.
  def admin?
    !!(role.try(:name) == "admin")
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  #class << self
  #  Role.find_each do |role|
  #    define_method role.name.pluralize do
  #      joins(:role).where(roles: { name: role.name })
  #    end
  #  end
  #end

  def self.method_missing(method, *args, &block)
    #role_methods = Role.pluck(:name).reduce({}){|h,name| h.merge!(name.downcase.strip.gsub(/\s+/, '_').pluralize => name)}.symbolize_keys
    # Allow scoping by Role. So if there is a set of roles such as ["admin", "physician", "nurse"] then the following should work:
    # User.admins #=> returns all Users with admin role
    # User.physicians #=> returns all Users with physician role
    # User.nurses #=> return all Users with nurse role
    role_methods = Role.pluck(:name).reduce({}){|h,name| h.merge!(name.parameterize(separator: '_').pluralize => name)}.symbolize_keys
    if role_methods.keys.include? method
      joins(:role).where(roles: { name: role_methods[method] })
    else
      super method, *args, &block
    end
  end

  def method_missing(method, *args, &block)
    role_methods = Role.pluck(:name).reduce({}){|h,name| h.merge!("#{name.parameterize(separator: '_')}?" => name)}.symbolize_keys
    if role_methods.keys.include? method
      role.name == role_methods[method]
    else
      super method, *args, &block
    end
  end
end
