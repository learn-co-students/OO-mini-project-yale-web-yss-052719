# An Allergen is a join between a user and an ingredient.
# This is a has-many-through relationship.
class Allergen

  attr_reader :user, :ingredient

  @@allergens = []

  def initialize(user, ingredient)
    @@allergens.append(self)

    @user = user
    @ingredient = ingredient
  end

  # return all of the Allergen instances
  def self.all
    @@allergens
  end
end