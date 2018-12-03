RSpec.describe RecipeIngredient do
  let(:flour) { Ingredient.new('Flour') }
  let(:pepper) { Ingredient.new('Pepper') }
  let(:carrot) { Ingredient.new('Carrot') }

  let(:pancake) { Recipe.new('Pancake') }
  let(:omelette) { Recipe.new('Omelette') }
  let(:salad) { Recipe.new('Salad') }

  let(:ri_pf) { RecipeIngredient.new(pancake, flour) }
  let(:ri_op) { RecipeIngredient.new(omelette, pepper) }
  let(:ri_sc) { RecipeIngredient.new(salad, carrot) }

  # check that all instances are accounted for
  context '.all' do
    it 'should have all instances' do
      expected = [ri_pf, ri_op, ri_sc]
      expect(RecipeIngredient.all).to match_array(expected)
    end
  end

  # check mutators
  context 'ingredient' do
    it 'should have ingredient gettr' do
      expect(ri_pf.ingredient).to eql(flour)
    end

    it 'should not have ingredient setter' do
      # noinspection RubyResolve
      expect { ri_pf.ingredient = double }.to raise_error(NoMethodError)
    end
  end

  context 'recipe' do
    it 'should have recipe gettr' do
      expect(ri_pf.recipe).to eql(pancake)
    end

    it 'should not have recipe setter' do
      # noinspection RubyResolve
      expect { ri_pf.recipe = double }.to raise_error(NoMethodError)
    end
  end
end
