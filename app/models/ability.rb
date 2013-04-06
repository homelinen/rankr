class Ability


  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.id

      # Can create tournaments and managed created ones
      can :manage, Tournament, :user_id => user.id
      can :create, Tournament

      can :manage, Match, :tournament => { :user_id => user.id }
      can :create, Match
      can :manage, Award, :match => { :tournament => { :user_id => user.id } }
      can :create, Award
    end

    can :read, :all
    can :index, :all
  end
end
