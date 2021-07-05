class Recipe
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def users
        RecipeCard.all.select do |rc|
            rc.recipe == self
        end.map do |rc|
            rc.user
        end
    end

    def add_ingredients(ingredients)
        ingredients.each do |ingredient|
            RecipeIngredient.new(self, ingredient)
        end
    end

    def ingredients
        RecipeIngredient.all.select do |ri|
            ri.recipe == self
        end.map do |ri|
            ri.ingredient
        end
    end

    def self.most_popular
        self.all.max_by do |recipe|
            RecipeCard.all.select do |rc|
                rc.recipe == recipe
            end.size
        end
    end

    def allergens
        allergic_ings = Allergy.all.map do |allergy|
            allergy.ingredient
        end

        self.ingredients.select do |ingredient|
            allergic_ings.include?(ingredient)
        end
    end
end