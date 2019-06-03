class User
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def recipes
        RecipeCard.all.select do |card|
            card.user == self
        end
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(date, rating, self, recipe)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        Allergy.all.select do |allergy|
            allergy.user == self
        end.map do |allergy|
            allergy.ingredient
        end
    end

    def top_three_recipes
        self.recipes.sort_by do |recipe|
            recipe.rating
        end.reverse[0..2]
    end

    def most_recent_recipe
        self.recipes.max_by do |recipe|
            recipe.date
        end
    end
end