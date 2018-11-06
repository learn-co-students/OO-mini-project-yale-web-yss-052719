class Recipe
  @@recipes = []

  def initialize
    @@recipes << self
  end

  # return all of the recipe instances
  def self.all
    return @@recipes
  end

  # return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
  def self.most_popular

  end

  # return the user instances who have recipe cards with this recipe
  def users

  end

  # return all of the ingredients in this recipe
  def ingrediants

  end

  # return all of the ingredients in this recipe that are allergens
  def allergens

  end

  # take an array of ingredient instances as an argument,
  # and associate each of those ingredients with this recipe
  def add_ingredients(ingredients)

  end
end
