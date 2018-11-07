class User

  @@users = []

  attr_reader :name, :allergens

  def initialize(name)
    @@users.append(self)

    @name = name
    @recipe_cards = []
    @allergens = []
  end

  # return all of the user instances
  def self.all
    @@users
  end

  # return all of the recipes this user has recipe cards for
  def recipes
    @recipe_cards.map { |card| card.recipe }
  end

  # accept a recipe instance as an argument, as well as a date and rating, and
  # create a new recipe card for this user and the given recipe
  def add_recipe_card(recipe, date, rating)
    @recipe_cards.append(
      RecipeCard.new(recipe, self, date, rating)
    )
  end

  # accept an ingredient instance as an argument, and create a new allergen
  # instance for this user and the given ingredient
  def declare_allergen(ingredient)
    @allergens.append(
      Allergen.new(user, ingredient)
    )
  end

  # return the top three highest rated recipes for this user
  def top_three_recipes
    @recipe_cards.sort { |a, b| b.rating <=> a.rating }.first(3).map { |card| card.recipe }
  end

  # return the recipe most recently added to the user's cookbook
  def most_recent_recipe
    @recipe_cards.last.recipe
  end
end