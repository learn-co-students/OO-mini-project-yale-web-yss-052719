RSpec.describe Ingredient do
  let(:flour) { Ingredient.new('Flour') }
  let(:pepper) { Ingredient.new('Pepper') }
  let(:carrot) { Ingredient.new('Carrot') }

  # check that all instances are accounted for
  context '.all' do
    it 'should have all instances' do
      expected = [flour, pepper, carrot]
      expect(Ingredient.all).to match_array(expected)
    end
  end

  context '.most_common_allergen' do
    before do
      # add more than one user to test user selection
      # add more than one ingredient to test ingredient selection
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
