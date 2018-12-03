# noinspection RubyClassVariableUsageInspection
class Recipe
  # User readers instead of explicit methods
  attr_reader :name

  @@all = []

  def initialize(name)
    @@all.append(self)

    @name = name
  end

  # return all of the recipe instances
  def self.all
    @@all
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
        # count the results
        # do ... end.count is the same as { ... }.count
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
    # Iterate over all the ingredients in this recipe
    ingredients.select do |ingredient|
      # Make an array of all ingredients added as an allergen and use uniq to remove
      # duplicates. Then check if this list contains the current ingredient.
      Allergen.all.map { |allergen| allergen.ingredient }.uniq.include?(ingredient)
    end
  end

  # take an array of ingredient instances as an argument,
  # and associate each of those ingredients with this recipe
  def add_ingredients(ingredients)
    ingredients.each { |ingredient| RecipeIngredient.new(self, ingredient) }
  end
end
