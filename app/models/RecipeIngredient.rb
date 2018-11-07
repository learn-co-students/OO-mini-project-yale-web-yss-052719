# RecipeIngredient is the join between an ingredient and a recipe.
# This is a has-many-through relationship
class RecipeIngredient
  @@recipe_ingredients = []

  attr_reader :ingredient, :recipe

  def initialize(recipe, ingredient)
    @@recipe_ingredients.append(self)

    @recipe = recipe
    @ingredient = ingredient
  end

  # return all of the RecipeIngredient instances
  def self.all
    return @@recipe_ingredients
  end
end
