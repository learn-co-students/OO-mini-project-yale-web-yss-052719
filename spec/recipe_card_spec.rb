require 'date'

RSpec.describe RecipeCard do
  let(:pancake) { Recipe.new('Pancake') }
  let(:omelette) { Recipe.new('Omelette') }
  let(:salad) { Recipe.new('Salad') }

  let(:shinji) { User.new('Shinji') }
  let(:asuka) { User.new('Asuka') }
  let(:rei) { User.new('Rei') }

  let(:date) { Date.new }
  let(:rating) { rand(100) }

  let(:rc_ps) { RecipeCard.new(pancake, shinji, date, rating) }
  let(:rc_oa) { RecipeCard.new(omelette, asuka, date, rating) }
  let(:rc_sr) { RecipeCard.new(salad, rei, date, rating) }

  context '.all' do
    it 'should have all instances' do
      expected = [rc_ps, rc_oa, rc_sr]
      expect(RecipeCard.all).to eql(expected)
    end
  end

  context 'recipe' do
    it 'should have recipe gettr' do
      expect(rc_ps.recipe).to eql(pancake)
    end

    it 'should not have recipe setter' do
      expect { rc_ps.recipe = double } .to raise_error(NoMethodError)
    end
  end

  context 'user' do
    it 'should have user gettr' do
      expect(rc_ps.user).to eql(shinji)
    end

    it 'should not have user setter' do
      expect { rc_ps.user = double }.to raise_error(NoMethodError)
    end
  end

  context 'date' do
    it 'should have date gettr' do
      expect(rc_ps.date).to eql(date)
    end

    it 'should not have date setter' do
      expect { rc_ps.date = double }.to raise_error(NoMethodError)
    end
  end

  context 'rating' do
    it 'should have rating gettr' do
      expect(rc_ps.rating).to eql(rating)
    end

    it 'should not have date setter' do
      expect { rc_ps.rating = double }.to raise_error(NoMethodError)
    end
  end

end
