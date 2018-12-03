# RecipeIngredient is the join between an ingredient and a recipe.
# This is a has-many-through relationship
#
# noinspection RubyClassVariableUsageInspection
class RecipeIngredient
  # User readers instead of explicit methods
  attr_reader :ingredient, :recipe

  @@all = []

  def initialize(recipe, ingredient)
    @@all.append(self)

    @recipe = recipe
    @ingredient = ingredient
  end

  # return all of the RecipeIngredient instances
  def self.all
    @@all
  end
end
