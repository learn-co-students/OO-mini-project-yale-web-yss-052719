require 'date'

RSpec.describe User do
  # Users
  let(:shinji) { User.new('Shinji') }
  let(:asuka) { User.new('Asuka') }
  let(:rei) { User.new('Rei') }

  let(:users) { [shinji, asuka, rei] }

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

  context '.all' do
    it 'should have all instances' do
      expect(User.all).to eql(users)
    end
  end

  context '#add_recipe_card' do
    before do
      shinji_pancake
    end

    it 'should find recipe card' do
      expect(RecipeCard.all.find { |rc| rc.user == shinji}).to eql(shinji_pancake)
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
    it 'should be '
  end

end
