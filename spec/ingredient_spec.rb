RSpec.describe Ingredient do
  let(:flour) { Ingredient.new('Flour') }
  let(:pepper) { Ingredient.new('Pepper') }
  let(:carrot) { Ingredient.new('Carrot') }

  context '.all' do
    it 'should have all instances' do
      expected = [flour, pepper, carrot]
      expect(Ingredient.all).to eql(expected)
    end
  end

  context '.most_common_allergen' do
    before do
      shinji = User.new('Shinji')
      asuka = User.new('Asuka')
      rei = User.new('Rei')

      Allergen.new(shinji, flour)
      Allergen.new(rei, flour)
      Allergen.new(asuka, pepper)
    end

    it 'should be flour' do
      expect(Ingredient.most_common_allergen).to eql(flour)
    end
  end
end
