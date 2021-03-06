class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)

=begin
       if user.admin?
         if user.role == "admin"
          can :manage, :all
                 end
         else
         can :read, :all
         #can [:create, :update], :reviews
         end
=end

       if user && user.admin?
         can :access, :rails_admin       # only allow admin users to access Rails Admin
         can :dashboard                  # allow access to dashboard
         if user.is? :masteradmin
           can :manage, :all             # allow superadmins to do anything
         elsif user.is? :manager
           can :manage, [User, Listing, Event, Review]  # allow managers to do anything to products and users
         elsif user.is? :moderator
           can :update, [Review], :hidden => false  # allow sales to only update visible products
         end
       else
         can :read, :all
       end

    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
