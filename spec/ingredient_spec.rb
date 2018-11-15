require 'rspec'
require 'spec_helper'

RSpec.describe Ingredient do
  let(:flour) {Ingredient.new('Flour')}
  let(:pepper) {Ingredient.new('Pepper')}
  let(:carrot) {Ingredient.new('Carrot')}
  let(:ingredients) { [flour, pepper, carrot] }

  context '.all' do
    it 'should have all instances' do
      expect(Ingredient.all).to eql(ingredients)
    end
  end

end