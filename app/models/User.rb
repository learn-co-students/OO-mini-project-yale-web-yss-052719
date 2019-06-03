class User
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(date, rating, self, recipe)
    end

    def get_recipe_cards
        RecipeCard.all.select do |rc|
            rc.user == self
        end
    end

    def recipes
        self.get_recipe_cards.map do |rc|
            rc.recipe
        end
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
        sorted = self.get_recipe_cards.sort_by do |rc|
            rc.rating
        end.reverse

        sorted[0..2]
    end

    def most_recent_recipe
        self.get_recipe_cards.max_by do |rc|
            rc.date
        end
    end
end