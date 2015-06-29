class Ability
  include CanCan::Ability

  # Run "x.update_column :writer, true" in rails C to set abilities

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, Comment, :user_id => user.id

    if user.admin?
      can :manage, Post
      can :manage, Comment
    elsif user.writer?
      can :manage, Post
    else
      can :read, Post
      can :read, Comment
    end

    
    
  end
end
