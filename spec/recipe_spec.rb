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
  let(:rei_salad) { rei.add_recipe_card(salad, Date.new, rand(100)) }

  # Allergens
  let(:a_shinji_flour) { Allergen.new(shinji, flour) }
  let(:a_asuka_pepper) { Allergen.new(asuka, pepper) }
  let(:a_asuka_onion) { Allergen.new(asuka, onion) }
  let(:a_rei_flour) { Allergen.new(rei, flour) }
  let(:a_rei_egg) { Allergen.new(rei, egg) }

  context '.all' do
    it 'should have all instances' do
      expected = [pancake, omelette, salad]
      expect(Recipe.all).to eql(expected)
    end
  end

  context '#add_ingredients' do
    it 'should receive ingredients for pancake' do
      mock_ri = class_double(RecipeIngredient)
      mock_ri.as_stubbed_const(transfer_nested_constants: true)

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
    before do
      pancake.add_ingredients(pancake_ing)
      omelette.add_ingredients(omelette_ing)
      a_shinji_flour
      a_asuka_onion
      a_rei_flour
      a_rei_egg
    end

    it 'should get only allergen ingredients for pancake' do
      expect(pancake.allergens).to match_array([egg, flour])
    end

    it 'should get only allergen ingredients for omelette' do
      expect(omelette.allergens).to match_array([egg, onion])
    end
  end

  context '.most_popular' do
    before do
      shinji_pancake
      asuka_pancake
      rei_pancake
      shinji_omelette
      asuka_omelette
      rei_salad
    end

    it 'should find pancake' do
      expect(Recipe.most_popular).to eql(pancake)
    end
  end
end
