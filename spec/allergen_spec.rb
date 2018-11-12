require 'rspec'
require 'spec_helper'
require 'Allergen.rb'
require 'Ingredient.rb'
require 'User.rb'

describe Allergen do
  before do
    @flour = Ingredient.new('Flour')
    @pepper = Ingredient.new('Pepper')
    @carrot = Ingredient.new('Carrot')

    @shinji = User.new('Shinji')
    @asuka = User.new('Asuka')
    @rei = User.new('Rei')

    @a_sf = Allergen.new(@shinji, @flour)
    @a_ap = Allergen.new(@asuka, @pepper)
    @a_rc = Allergen.new(@rei, @carrot)

    @allergens = [@a_sf, @a_ap, @a_rc]
  end

  describe '.all' do

    it 'should have all instances' do
      expect(Allergen.all).to eql(@allergens)
    end
  end

  describe 'ingredient' do
    it 'should have ingredient gettr' do
      expect(@a_sf.ingredient).to eql(@flour)
    end

    it 'should not have ingredient setter' do
      expect{@a_sf.ingredient=double}.to raise_error(NoMethodError)
    end
  end

  describe 'user' do
    it 'should have user gettr' do
      expect(@a_sf.user).to eql(@shinji)
    end

    it 'should not have user setter' do
      expect{@a_sf.user=double}.to raise_error(NoMethodError)
    end

  end
end