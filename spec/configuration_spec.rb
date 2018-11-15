Dir["./app/models/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.after(:all) do
    Allergen.class_eval { @@allergens = [] }
    Ingredient.class_eval { @@ingredients = [] }
    Recipe.class_eval { @@recipes = [] }
    RecipeCard.class_eval { @@recipe_cards = [] }
    RecipeIngredient.class_eval { @@recipe_ingredients = [] }
    User.class_eval { @@users = [] }
  end
end
