class Recipe

  attr_reader :name

  @@recipes = []

  def initialize(name)
    @@recipes.append(self)

    @name = name
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
    RecipeCard.all.select { |rc| rc.recipe == self }.map { |rc| rc.user }
  end

  def ingredients
    RecipeIngredient.all.select { |rec_ing| rec_ing.recipe == self }.map { |recipe| recipe.ingredient }
  end

  # return all of the ingredients in this recipe that are allergens
  def allergens
    ingredients.select do |ingredient|
      Allergen.all.map { |allergen| allergen.ingredient }.uniq.include?(ingredient)
    end
  end

  # take an array of ingredient instances as an argument,
  # and associate each of those ingredients with this recipe
  def add_ingredients(ingredients)
    ingredients.each { |ingredient| RecipeIngredient.new(self, ingredient) }
  end
end
