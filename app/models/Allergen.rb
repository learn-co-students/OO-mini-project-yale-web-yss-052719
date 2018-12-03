# An Allergen is a join between a user and an ingredient.
# This is a has-many-through relationship.
#
# noinspection RubyClassVariableUsageInspection
class Allergen
  # User readers instead of explicit methods
  attr_reader :user, :ingredient

  @@all = []

  def initialize(user, ingredient)
    @@all.append(self)

    @user = user
    @ingredient = ingredient
  end

  # return all of the Allergen instances
  def self.all
    @@all
  end
end