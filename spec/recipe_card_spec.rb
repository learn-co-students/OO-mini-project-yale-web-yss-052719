require 'rspec'
require 'spec_helper'
require 'date'
require 'RecipeCard.rb'
require 'Recipe.rb'
require 'User.rb'

describe RecipeCard do
  before do
    @pancake = Recipe.new('Pancake')
    @omelette = Recipe.new('Omelette')
    @salad = Recipe.new('Salad')

    @shinji = User.new('Shinji')
    @asuka = User.new('Asuka')
    @rei = User.new('Rei')

    @date = Date.new
    @rating = rand(100)

    @rc_ps = RecipeCard.new(@pancake, @shinji, @date, @rating)
    @rc_oa = RecipeCard.new(@omelette, @asuka, @date, @rating)
    @rc_sr = RecipeCard.new(@salad, @rei, @date, @rating)

    @recipe_cards = [@rc_ps, @rc_oa, @rc_sr]
  end

  describe '.all' do

    it 'should have all instances' do
      expect(RecipeCard.all).to eql(@recipe_cards)
    end
  end

  describe 'recipe' do
    it 'should have recipe gettr' do
      expect(@rc_ps.recipe).to eql(@pancake)
    end

    it 'should not have recipe setter' do
      expect { @rc_ps.recipe = double } .to raise_error(NoMethodError)
    end
  end

  describe 'user' do
    it 'should have user gettr' do
      expect(@rc_ps.user).to eql(@shinji)
    end

    it 'should not have user setter' do
      expect { @rc_ps.user = double }.to raise_error(NoMethodError)
    end
  end

  describe 'date' do
    it 'should have date gettr' do
      expect(@rc_ps.date).to eql(@date)
    end

    it 'should not have date setter' do
      expect { @rc_ps.date = double }.to raise_error(NoMethodError)
    end
  end

  describe 'rating' do
    it 'should have rating gettr' do
      expect(@rc_ps.rating).to eql(@rating)
    end

    it 'should not have date setter' do
      expect { @rc_ps.rating = double }.to raise_error(NoMethodError)
    end
  end

end