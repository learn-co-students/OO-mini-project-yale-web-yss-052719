# RecipeIngredient is the join between an ingredient and a recipe.
# This is a has-many-through relationship
class RecipeIngredient

  attr_reader :ingredient, :recipe

  @@recipe_ingredients = []

  def initialize(recipe, ingredient)
    @@recipe_ingredients.append(self)

    @recipe = recipe
    @ingredient = ingredient
  end

  # return all of the RecipeIngredient instances
  def self.all
    @@recipe_ingredients
  end
end
