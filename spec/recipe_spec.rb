require 'date'

RSpec.describe Recipe do
  # Users
  let(:shinji) { User.new('Shinji') }
  let(:asuka) { User.new('Asuka') }
  let(:rei) { User.new('Rei') }

  # Ingredients
  let(:flour) { Ingredient.new('Flour') }
  let(:sugar) { Ingredient.new('Sugar') }
  let(:egg) { Ingredient.new('Egg') }
  let(:milk) { Ingredient.new('Milk') }
  let(:green_pepper) { Ingredient.new('Green Pepper') }
  let(:onion) { Ingredient.new('Onion') }

  # Recipes
  let(:pancake) { Recipe.new('Pancake') }
  let(:omelette) { Recipe.new('Omelette') }
  let(:salad) { Recipe.new('Salad') }

  # Recipe Ingredients
  let(:pancake_ing) { [flour, sugar, egg] }
  let(:omelette_ing) { [egg, milk, green_pepper, onion] }

  # Recipe cards
  let(:shinji_pancake) { shinji.add_recipe_card(pancake, Date.new, rand(100)) }
  let(:asuka_pancake) { asuka.add_recipe_card(pancake, Date.new, rand(100)) }
  let(:rei_pancake) { rei.add_recipe_card(pancake, Date.new, rand(100)) }
  let(:shinji_omelette) { shinji.add_recipe_card(omelette, Date.new, rand(100)) }
  let(:asuka_omelette) { asuka.add_recipe_card(omelette, Date.new, rand(100)) }

  def getUserItems(_class, user)
    _class.all.select { |rc| rc.user == user }
  end

  context '.all' do
    it 'should have all instances' do
      expected = [pancake, omelette, salad]
      expect(Recipe.all).to eql(expected)
    end
  end

  context '#add_ingredients' do
    it 'should receive ingredients for pancake' do
      mock_ri = class_double(RecipeIngredient)
      mock_ri.as_stubbed_const(:transfer_nested_constants => true)

      expect(mock_ri).to receive(:new).with(pancake, flour)
      expect(mock_ri).to receive(:new).with(pancake, sugar)
      expect(mock_ri).to receive(:new).with(pancake, egg)

      pancake.add_ingredients(pancake_ing)
    end
  end

  context '#ingredients' do
    before do
      pancake.add_ingredients(pancake_ing)
      omelette.add_ingredients(omelette_ing)
    end

    it 'should have ingredients for pancake' do
      expect(pancake.ingredients).to eql(pancake_ing)
    end

    it 'should have ingredients for omelette' do
      expect(omelette.ingredients).to eql(omelette_ing)
    end
  end

  context '#users' do
    before do
      shinji_pancake
      shinji_omelette
      asuka_pancake
      asuka_omelette
      rei_pancake
    end

    it 'should give only users for pancake' do
      expect(pancake.users).to eql([shinji, asuka, rei])
    end

    it 'should give only users for omelette' do
      expect(omelette.users).to eql([shinji, asuka])
    end
  end

  context '#allergens' do
    it 'should'
  end

  context '.most_popular' do
    it 'should'
  end
end
