# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all                 # allow everyone to read everything
    return unless user && user.admin?
    can :access, :rails_admin       # only allow admin users to access Rails Admin
    can :read, :dashboard           # allow access to dashboard
    can :manage, :all  
  end
end
