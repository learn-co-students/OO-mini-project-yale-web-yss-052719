# A RecipeCard is the join between a user instance and a recipe instance.
# This is a has-many-through relationship.

class RecipeCard
  @@recipe_cards = []

  def initialize
    @@recipe_cards << self
  end

  # return all of the RecipeCard instances
  def self.all
    return @@recipe_cards
  end

  # return the date of the entry
  def date
    return @date
  end

  # return the rating (an integer) a user has given their entry
  def rating
    return @rating
  end

  # return the user to which the entry belongs
  def user
    return @user
  end

  # return the recipe to which the entry belongs
  def recipe
    return @recipe
  end
end
