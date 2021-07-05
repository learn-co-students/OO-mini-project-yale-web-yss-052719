require_relative '../config/environment.rb'

max = User.new("Max")
ganesh = User.new("Ganesh")
gigi = User.new("Gigi")

lasagna = Recipe.new("Lasagna")
pizza = Recipe.new("Pizza")
burger = Recipe.new("Burger")

cheese = Ingredient.new("Cheese")
tomato = Ingredient.new("Tomato")
bread = Ingredient.new("Bread")
beef = Ingredient.new("Beef")

lasagna.add_ingredients([cheese, tomato, beef])
pizza.add_ingredients([cheese, tomato, bread])
burger.add_ingredients([cheese, bread, beef])

ganesh.add_recipe_card(lasagna, "2019-06-03", 8)
max.add_recipe_card(pizza, "2019-06-02", 7)
max.add_recipe_card(lasagna, "2019-06-01", 9)
max.add_recipe_card(burger, "1766-06-03", 10)

ganesh.declare_allergy(bread)
max.declare_allergy(bread)
max.declare_allergy(cheese)

binding.pry
0