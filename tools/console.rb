require_relative '../config/environment.rb'
require_relative '../app/models/Allergy.rb'
require_relative '../app/models/Ingredient.rb'
require_relative '../app/models/Recipe.rb'
require_relative '../app/models/RecipeCard.rb'
require_relative '../app/models/RecipeIngredient.rb'
require_relative '../app/models/User.rb'

# jenna = RecipeCard.new("jennaz01", "my_recipe", "2019-06-03", 4)

jenna_z = User.new("Jenna")
peanut = Ingredient.new("Peanut")
choc = Ingredient.new("Choc")
milk = Ingredient.new("Milk")

jenna_allergy = jenna_z.declare_allergy(peanut)
jenna_allergy2 = jenna_z.declare_allergy(choc)

matt_p = User.new("Matt")
matt_allergy = matt_p.declare_allergy(choc)

jenna_recipe = Recipe.new("Jennas_bakedgoods")
jenna_recipe2 = Recipe.new("Jennas_bakedgoods2")
jenna_recipe3 = Recipe.new("Jennas_bakedgoods3")
jenna_recipe4 = Recipe.new("Jennas_bakedgoods4")

matt_recipe = Recipe.new("my_recipe")

jenna_rcard1 = RecipeCard.new(jenna_z, jenna_recipe, "2019-03-01", 5)
jenna_rcard2 = RecipeCard.new(jenna_z, jenna_recipe2, "2019-04-01", 1)
jenna_rcard3 = RecipeCard.new(jenna_z, jenna_recipe3, "2019-05-01", 3)
jenna_rcard4 = RecipeCard.new(jenna_z, jenna_recipe4, "2019-06-01", 4)

matt_rcard = RecipeCard.new(matt_p, jenna_recipe, "2019-05-03", 3)

jenna_ri = RecipeIngredient.new(jenna_recipe, peanut)
jenna_ri2 = RecipeIngredient.new(jenna_recipe, choc)
jenna_ri3 = RecipeIngredient.new(jenna_recipe, milk)

cheese = Ingredient.new("Cheese")
bread = Ingredient.new("Bread")
ingredients = [cheese, bread]
added_ingredients = jenna_recipe.add_ingredients(ingredients)

binding.pry