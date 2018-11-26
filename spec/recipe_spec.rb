require 'date'

RSpec.describe Recipe do
  let(:pancake) { Recipe.new('Pancake') }
  let(:omelette) { Recipe.new('Omelette') }
  let(:salad) { Recipe.new('Salad') }

  def getUserItems(_class, user)
    _class.all.select { |rc| rc.user == user }
  end

  context '.all' do
    it 'should have all instances' do
      expected = [pancake, omelette, salad]
      expect(Recipe.all).to eql(expected)
    end
  end

  context '#ingredients' do
    it 'should'
  end

  context '.most_popular' do
    it 'should'
  end

  context '#users' do
    it 'should'
  end

  context '#add_ingredients' do
    it 'should'
  end

  context '#allergens' do
    it 'should'
  end

end
