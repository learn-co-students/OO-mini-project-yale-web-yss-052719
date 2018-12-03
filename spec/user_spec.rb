require 'date'

RSpec.describe User do
  # Users
  let(:shinji) { User.new('Shinji') }
  let(:asuka) { User.new('Asuka') }
  let(:rei) { User.new('Rei') }

  # Ingredients
  let(:flour) { Ingredient.new('Flour') }
  let(:pepper) { Ingredient.new('Pepper') }
  let(:carrot) { Ingredient.new('Carrot') }
  let(:lettuce) { Ingredient.new('Lettuce')}

  # Recipes
  let(:pancake) { Recipe.new('Pancake') }
  let(:omelette) { Recipe.new('Omelette') }
  let(:salad) { Recipe.new('Salad') }
  let(:fried_potatoes) { Recipe.new('Fried Potatoes') }
  let(:bec) { Recipe.new('Bacon, Egg, and Cheese') }

  # Recipe cards
  let(:shinji_pancake) { shinji.add_recipe_card(pancake, Date.new, rand(100)) }
  let(:shinji_omelette) { shinji.add_recipe_card(omelette, Date.new, rand(100)) }
  let(:shinji_salad) { shinji.add_recipe_card(salad, Date.new, rand(100)) }
  let(:shinji_fried_potatoes) { shinji.add_recipe_card(fried_potatoes, Date.new, rand(100)) }
  let(:asuka_pancake) { asuka.add_recipe_card(pancake, Date.new, rand(100)) }
  let(:asuka_omelette) { asuka.add_recipe_card(omelette, Date.new, rand(100)) }
  let(:asuka_salad) { asuka.add_recipe_card(salad, Date.new, rand(100)) }
  let(:asuka_fried_potatoes) { asuka.add_recipe_card(fried_potatoes, Date.new, rand(100)) }
  let(:asuka_bec) { asuka.add_recipe_card(bec, Date.new, rand(100)) }

  # Allergens
  let(:a_shinji_flour) { Allergen.new(shinji, flour) }
  let(:a_shinji_pepper) { Allergen.new(shinji, pepper) }
  let(:a_asuka_pepper) { Allergen.new(asuka, pepper) }

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
    it 'should return ingredients user is allergic to'
  end

  context '#safe_recipes' do
    it 'should return recipes which the user is not allergic to'
  end
end
