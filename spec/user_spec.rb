require 'date'

RSpec.describe User do
  # Users
  let(:shinji) { User.new('Shinji') }
  let(:asuka) { User.new('Asuka') }
  let(:rei) { User.new('Rei') }

  # Ingredients
  let(:flour) { Ingredient.new('Flour') }
  let(:sugar) { Ingredient.new('Sugar') }
  let(:milk) { Ingredient.new('Milk') }
  let(:green_pepper) { Ingredient.new('Green Pepper') }
  let(:onion) { Ingredient.new('Onion') }
  let(:pepper) { Ingredient.new('Pepper') }
  let(:carrot) { Ingredient.new('Carrot') }
  let(:lettuce) { Ingredient.new('Lettuce') }
  let(:bacon) { Ingredient.new('Bacon') }
  let(:egg) { Ingredient.new('Egg') }
  let(:cheese) { Ingredient.new('Cheese') }

  # Recipes
  let(:pancake) { Recipe.new('Pancake') }
  let(:omelette) { Recipe.new('Omelette') }
  let(:salad) { Recipe.new('Salad') }
  let(:fried_potatoes) { Recipe.new('Fried Potatoes') }
  let(:bec) { Recipe.new('Bacon, Egg, and Cheese') }

  # Recipe Ingredients
  let(:pancake_ing) { [flour, sugar, egg] }
  let(:omelette_ing) { [egg, milk, green_pepper, onion, cheese] }
  let(:salad_ing) { [lettuce, carrot, onion, green_pepper] }
  let(:bec_ing) { [bacon, egg, cheese] }

  # Recipe cards
  let(:shinji_pancake) { shinji.add_recipe_card(pancake, Date.new, rand(100)) }
  let(:shinji_omelette) { shinji.add_recipe_card(omelette, Date.new, rand(100)) }
  let(:shinji_salad) { shinji.add_recipe_card(salad, Date.new, rand(100)) }
  let(:shinji_fried_potatoes) { shinji.add_recipe_card(fried_potatoes, Date.new, rand(100)) }
  let(:shinji_bec) { shinji.add_recipe_card(bec, Date.new, rand(100)) }
  let(:asuka_pancake) { asuka.add_recipe_card(pancake, Date.new, rand(100)) }
  let(:asuka_omelette) { asuka.add_recipe_card(omelette, Date.new, rand(100)) }
  let(:asuka_salad) { asuka.add_recipe_card(salad, Date.new, rand(100)) }
  let(:asuka_fried_potatoes) { asuka.add_recipe_card(fried_potatoes, Date.new, rand(100)) }
  let(:asuka_bec) { asuka.add_recipe_card(bec, Date.new, rand(100)) }
  let(:rei_pancake) { rei.add_recipe_card(pancake, Date.new, rand(100)) }
  let(:rei_omelette) { rei.add_recipe_card(omelette, Date.new, rand(100)) }
  let(:rei_salad) { rei.add_recipe_card(salad, Date.new, rand(100)) }
  let(:rei_bec) { rei.add_recipe_card(bec, Date.new, rand(100)) }

  # Allergens
  let(:a_shinji_flour) { Allergen.new(shinji, flour) }
  let(:a_shinji_pepper) { Allergen.new(shinji, pepper) }
  let(:a_shinji_egg) { Allergen.new(shinji, egg) }
  let(:a_asuka_egg) { Allergen.new(asuka, egg) }
  let(:a_asuka_green_pepper) { Allergen.new(asuka, green_pepper) }

  def getUserItems(_class, user)
    _class.all.select { |rc| rc.user == user }
  end

  context '.all' do
    it 'should have all instances' do
      expected = [shinji, asuka, rei]
      expect(User.all).to eql(expected)
    end
  end

  context '#add_recipe_card' do
    before do
      shinji_pancake
      asuka_salad
    end

    it 'should find shinjis recipe card' do
      expect(getUserItems(RecipeCard, shinji).first).to(eql(shinji_pancake))
    end

    it 'should find asukas recipe card' do
      expect(getUserItems(RecipeCard, asuka).first).to(eql(asuka_salad))
    end
  end

  context '#recipes' do
    before do
      shinji_pancake
      shinji_omelette
      shinji_salad
      asuka_pancake
      asuka_fried_potatoes
    end

    it 'should just be shinjis recipes' do
      expect(shinji.recipes).to eql([pancake, omelette, salad])
    end

    it 'should just be asukas recipes' do
      expect(asuka.recipes).to eql([pancake, fried_potatoes])
    end
  end

  context '#most_recent_recipe' do
    before do
      shinji_pancake
      shinji_omelette
      asuka_pancake
      asuka_fried_potatoes
    end

    it 'should be omelette for shinji' do
      expect(shinji.most_recent_recipe).to eql(omelette)
    end

    it 'should be fried potatoes for asuka' do
      expect(asuka.most_recent_recipe).to eql(fried_potatoes)
    end
  end

  context '#top_three_recipes' do
    before do
      shinji_pancake
      shinji_omelette
      shinji_salad
      shinji_fried_potatoes
      asuka_pancake
      asuka_omelette
      asuka_fried_potatoes
      asuka_bec
    end

    it 'should be shinjis top three' do
      recipes = [shinji_pancake, shinji_omelette, shinji_salad, shinji_fried_potatoes]
      expect(shinji.top_three_recipes).to match_array(build_expected(recipes))
    end

    it 'should be asukas top three' do
      recipes = [asuka_pancake, asuka_omelette, asuka_fried_potatoes, asuka_bec]
      expect(asuka.top_three_recipes).to match_array(build_expected(recipes))
    end

    def build_expected(recipes)
      recipes.sort_by(&:rating).last(3).map(&:recipe)
    end
  end

  context '#declare_allergen' do
    it 'should receive ingredient for allergen' do
      mock_a = class_double(Allergen)
      mock_a.as_stubbed_const(transfer_nested_constants: true)
      expect(mock_a).to receive(:new).with(shinji, flour)
      shinji.declare_allergen(flour)
    end
  end

  context '#allergens' do
    before do
      a_shinji_flour
      a_shinji_pepper
      a_asuka_egg
    end

    it 'should return ingredients shinji is allergic to' do
      expect(shinji.allergens).to match_array([flour, pepper])
    end

    it 'should return ingredients asuka is allergic to' do
      expect(asuka.allergens).to match_array([egg])
    end
  end

  context '#safe_recipes' do
    before do
      # Add ingredients to recipes
      pancake.add_ingredients(pancake_ing)
      omelette.add_ingredients(omelette_ing)
      salad.add_ingredients(salad_ing)
      bec.add_ingredients(bec_ing)

      # Add recipe cards
      shinji_pancake
      shinji_omelette
      shinji_salad
      shinji_bec
      asuka_pancake
      asuka_omelette
      asuka_salad
      asuka_bec
      rei_pancake
      rei_omelette
      rei_salad
      rei_bec

      # Specify allergens
      a_shinji_egg
      a_asuka_green_pepper
    end

    it 'should return recipes which shinji is not allergic to' do
      expect(shinji.safe_recipes).to eql([salad])
    end

    it 'should return recipes which asuka is not allergic to' do
      expect(asuka.safe_recipes).to match_array([pancake, bec])
    end

    it 'should return all recipes for rei' do
      expect(rei.safe_recipes).to match_array([pancake, omelette, salad, bec])
    end
  end
end
