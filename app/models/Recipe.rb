class Recipe
  @@recipes = []

  attr_reader :name, :ingredients

  def initialize(name)
    @@recipes.append(self)

    @name = name
    @recipe_ingredients = []
  end

  # return all of the recipe instances
  def self.all
    @@recipes
  end

  # return the recipe instance with the highest number of users
  # (the recipe that has the most recipe cards)
  def self.most_popular
    # grab all the recipes
    Recipe.all.max_by do |recipe|
      # compare each recipe by the number of recipe cards which
      # include this particular recipe
      RecipeCard.all.select do |card|
        card.recipe == recipe
      end.count
    end
  end

  # return the user instances who have recipe cards with this recipe
  def users
    User.all.select { |user| user.recipes.include?(self) }
  end

  def ingredients
    @recipe_ingredients.map { |rec_ing| rec_ing.ingredient}
  end

  # return all of the ingredients in this recipe that are allergens
  def allergens
  end

  # take an array of ingredient instances as an argument,
  # and associate each of those ingredients with this recipe
  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      @recipe_ingredients.append(RecipeIngredient.new(self, ingredient))
    end
  end
end
