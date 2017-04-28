class RecordTypePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def update_sort_position?
    true
  end
end
