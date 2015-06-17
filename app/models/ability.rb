class Ability
  include CanCan::Ability

  # Run "x.update_column :writer, true" in rails C to set abilities

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.writer?
      can :manage, Post
    else
      can :read, :all
    end
  end
end
