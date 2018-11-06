# RecipeIngredient is the join between an ingredient and a recipe.
# This is a has-many-through relationship
class RecipeIngredient
  @@recipe_ingredients = []

  def initialize
    @@recipe_ingredients << self
  end

  # return all of the RecipeIngredient instances
  def self.all
    return @@recipe_ingredients
  end

  # return the ingredient instance
  def ingredient

  end

  # return the recipe instance
  def recipe

  end
end
