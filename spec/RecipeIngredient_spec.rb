require 'rspec'
require 'spec_helper'
require 'RecipeIngredient.rb'
require 'Ingredient.rb'
require 'Recipe.rb'

describe RecipeIngredient do
  before do
    flour = Ingredient.new("Flour")
    pepper = Ingredient.new("Pepper")
    carrot = Ingredient.new("Carrot")

    pancake = Recipe.new("Pancake")
    omelette = Recipe.new("Omelette")
    salad = Recipe.new("Salad")

    @recipe_ingredients = []
    @recipe_ingredients << RecipeIngredient.new(pancake, flour)
    @recipe_ingredients << RecipeIngredient.new(omelette, pepper)
    @recipe_ingredients << RecipeIngredient.new(salad, carrot)
  end

  describe ".all" do

    it 'should have all instances' do
      expect(RecipeIngredient.all).to eql(@recipe_ingredients)
    end
  end
end