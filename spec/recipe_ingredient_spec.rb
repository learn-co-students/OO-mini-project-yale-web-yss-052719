require 'rspec'
require 'spec_helper'
require 'RecipeIngredient.rb'
require 'Ingredient.rb'
require 'Recipe.rb'

describe RecipeIngredient do
  before do
    @flour = Ingredient.new('Flour')
    @pepper = Ingredient.new('Pepper')
    @carrot = Ingredient.new('Carrot')

    @pancake = Recipe.new('Pancake')
    @omelette = Recipe.new('Omelette')
    @salad = Recipe.new('Salad')

    @ri_pf = RecipeIngredient.new(@pancake, @flour)
    @ri_op = RecipeIngredient.new(@omelette, @pepper)
    @ri_sc = RecipeIngredient.new(@salad, @carrot)

    @recipe_ingredients = [@ri_pf, @ri_op, @ri_sc]
  end

  describe '.all' do

    it 'should have all instances' do
      expect(RecipeIngredient.all).to eql(@recipe_ingredients)
    end
  end

  describe 'ingredient' do
    it 'should have ingredient gettr' do
      expect(@ri_pf.ingredient).to eql(@flour)
    end

    it 'should not have ingredient setter' do
      expect{@ri_pf.ingredient=double}.to raise_error(NoMethodError)
    end
  end

  describe 'recipe' do
    it 'should have recipe gettr' do
      expect(@ri_pf.recipe).to eql(@pancake)
    end

    it 'should not have recipe setter' do
      expect{@ri_pf.recipe=double}.to raise_error(NoMethodError)
    end

  end
end