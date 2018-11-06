class Recipe
  @@recipes = []

  def initialize
    @@recipes << self
  end

  # Recipe.all should return all of the recipe instances
  def self.all
    return @@recipes
  end

  # Recipe.most_popular should return the recipe instance with the highest number of users (the recipe that has the most
  # recipe cards)
  def self.most_popular

  end

  # Recipe#users should return the user instances who have recipe cards with this recipe
  def users

  end

  # Recipe#ingredients should return all of the ingredients in this recipe
  def ingrediants

  end

  # Recipe#allergens should return all of the ingredients in this recipe that are allergens
  def allergens

  end

  # Recipe#add_ingredients should take an array of ingredient instances as an argument, and associate each of those
  # ingredients with this recipe
  def add_ingredients(ingredients)

  end
end
