Dir["./app/models/*.rb"].each { |file| require file }
require 'pry'

CLASS_LIST = [Allergen, Ingredient, Recipe, RecipeCard, RecipeIngredient, User].freeze

def reset_class_vars(_class)
  _class.all.clear
end

RSpec.configure do |config|
  config.after(:each) do
    CLASS_LIST.each { |c| reset_class_vars(c) }
  end
end
