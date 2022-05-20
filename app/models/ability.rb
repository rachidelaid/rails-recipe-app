class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Recipe, public: true

    return unless user.present?

    can :manage, Recipe, user: user
    can :read, Food
    can :manage, Food, user: user
    can :manage, RecipeFood do |ingre|
      ingre.recipe.user == user
    end
  end
end
