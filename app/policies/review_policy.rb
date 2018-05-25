class ReviewPolicy < ApplicationPolicy

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    record.user == user
  end

  def edit?
    update?
  end

  def destroy?
    record.user == user
  end



  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
