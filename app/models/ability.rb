class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # for non-logged-in users

    if user.role == 'admin'
      can :manage, :all
    else
      can :delete, Post, author_id: user.id
      can :delete, Comment, user_id: user.id
    end
  end
end
