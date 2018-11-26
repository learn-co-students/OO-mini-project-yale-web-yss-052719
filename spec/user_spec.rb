require 'rspec'
require 'spec_helper'
require 'date'

RSpec.describe User do
  let(:shinji) { User.new('Shinji') }
  let(:asuka) { User.new('Asuka') }
  let(:rei) { User.new('Rei') }

  let(:users) { [shinji, asuka, rei] }

  let(:flour) { Ingredient.new('Flour') }
  let(:pepper) { Ingredient.new('Pepper') }
  let(:carrot) { Ingredient.new('Carrot') }

  context '.all' do
    it 'should have all instances' do
      expect(User.all).to eql(users)
    end
  end

  context '#recipes' do
    it 'should be flour' do
    end
  end

end
