class Recipe
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_popular
        recipe_hash = {}
        RecipeCard.all.each do |recipe_card|
            if !recipe_hash.keys.include?(recipe_card.recipe)
                recipe_hash[recipe_card.recipe] = 0
            end
            recipe_hash[recipe_card.recipe] += 1
        end
        recipe_hash.key(recipe_hash.values.max)
    end

    def ingredients
        RecipeIngredient.all.select do |ri|
            ri.recipe == self
        end.map do |ri|
            ri.ingredient
        end
    end

    def allergens
        self.ingredients.select do |ingredient|
            ingredient.allergen?
        end
    end

    def add_ingredients(ingredients)
        ingredients.each do |ingred|
            RecipeIngredient.new(ingred, self)
        end
    end

    def users
        RecipeCard.all.select do |card|
            card.recipe == self
        end
    end
end
