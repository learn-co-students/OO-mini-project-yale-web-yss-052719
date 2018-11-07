# A RecipeCard is the join between a user instance and a recipe instance.
# This is a has-many-through relationship.

class RecipeCard
  @@recipe_cards = []

  attr_reader :date, :rating, :user, :recipe

  def initialize(recipe, user, date, rating)
    @@recipe_cards.append(self)

    @recipe = recipe
    @user = user
    @date = date
    @rating = rating
  end

  # return all of the RecipeCard instances
  def self.all
    return @@recipe_cards
  end
end
