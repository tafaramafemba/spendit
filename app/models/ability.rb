# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all, user_id: user.id


    if user.admin? :admin
      can :manage, :all
    else
      can :manage, :all, user_id: user.id
    end
  end
end
