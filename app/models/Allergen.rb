# An Allergen is a join between a user and an ingredient.
# This is a has-many-through relationship.
class Allergen

  @@allergens = []

  def initialize
    @@allergens << self
  end

  # return all of the Allergen instances
  def self.all
    return @@allergens
  end
end