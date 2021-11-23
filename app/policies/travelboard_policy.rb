class TravelboardPolicy < ApplicationPolicy
  class Scope < Scope
    # index
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  # CAN BE EMPTY AS EDIT IS TAKING UPDATE VALUE ACCORDING TO APPLICATION_POLICY
  def edit?
  end

  def update?
    user == record.user || user.admin
  end

  def destroy_all
    user == record.user || user.admin
  end

end