class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.admin? or user.physician? or user.nurse? or user.secretary?
  end

  def show?
    user.admin? or user.physician? or user.nurse? or user.secretary?
  end

  def create?
    user.admin? or user.physician? or user.nurse? or user.secretary?
  end

  def update?
    user.admin? or user.physician? or user.nurse? or user.secretary?
  end

  def destroy?
    user.admin? or user.physician? or user.nurse? or user.secretary?
  end
end
