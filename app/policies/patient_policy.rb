class PatientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? 
        scope.all :
        user.patients
    end
  end

  def index?
    true
  end

  def show?
    return true if user.admin? 
    record.users.include? user
  end

  def create?
    user.admin? or user.physician? or user.nurse? or user.secretary?
  end

  def update?
    return true if user.admin? 
    record.users.include? user
  end

end
