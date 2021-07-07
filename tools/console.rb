require_relative '../config/environment.rb'


user1 = User.new("Tony")
user2 = User.new("Martha")
user3 = User.new("Don Pablo")

recipe1 = Recipe.new("cold bread")
recipe2= Recipe.new("ratatouile")
recipe3= Recipe.new("cereal w milk")

recipecard1 = RecipeCard.new(2013, 1, user1, recipe1)
recipecard2 = RecipeCard.new(2014, 2, user1, recipe2)
recipecard3 = RecipeCard.new(2015, 2, user2, recipe1)
recipecard4 = RecipeCard.new(2015, 2, user3, recipe1)

ingredient1 = Ingredient.new("bread")
ingredient2 = Ingredient.new("noodles")
ingredient3 = Ingredient.new("tomato sauce")
ingredient4 = Ingredient.new("cereal")
ingredient5 = Ingredient.new("milk")

recipeingredient1 = RecipeIngredient.new(ingredient1, recipe1)
recipeingredient2 = RecipeIngredient.new(ingredient2, recipe2)
recipeingredient3 = RecipeIngredient.new(ingredient3, recipe2)
recipeingredient4 = RecipeIngredient.new(ingredient4, recipe3)
recipeingredient5 = RecipeIngredient.new(ingredient5, recipe3)

allergy1 = Allergy.new(user1, ingredient1)
allergy2 = Allergy.new(user2, ingredient4)
allergy3 = Allergy.new(user3, ingredient3)
allergy4 = Allergy.new(user2, ingredient3)

binding.pry
