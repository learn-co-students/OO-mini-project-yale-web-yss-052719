require_relative '../config/environment.rb'

recipe1 = Recipe.new
recipe2 = Recipe.new
recipe3 = Recipe.new

user1 = User.new
user2 = User.new
user3 = User.new

ingredient1 = Ingredient.new
ingredient2 = Ingredient.new
ingredient3 = Ingredient.new

recipecard1 = RecipeCard.new(user1, recipe1, 06-03, 10)
recipecard2 = RecipeCard.new(user2, recipe1, 06-03, 9)
recipecard3 = RecipeCard.new(user3, recipe1, 06-02, 8)

# recipeingredient1 = RecipeIngredient.new(recipe1, ingredient1)
# recipeingredient2 = RecipeIngredient.new(recipe1, ingredient2)
# recipeingredient3 = RecipeIngredient.new(recipe1, ingredient3)

array = [ingredient1, ingredient2, ingredient3]
recipe1.add_ingredients(array)


binding.pry
0