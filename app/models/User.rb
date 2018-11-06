class User

  @@users = []

  def initialize
    @@users << self

  end

  # return all of the user instances
  def self.all
    return @@users
  end

  # return all of the recipes this user has recipe cards for
  def recipes

  end

  # accept a recipe instance as an argument, as well as a date and rating, and create a new
  # recipe card for this user and the given recipe
  def add_recipe_card

  end

  # accept an ingredient instance as an argument, and create a new allergen instance for
  # this user and the given ingredient
  def declare_allergen

  end

  # return all of the ingredients this user is allergic to
  def allergens

  end

  # return the top three highest rated recipes for this user
  def top_three_recipes

  end

  # return the recipe most recently added to the user's cookbook
  def most_recent_recipe

  end
end