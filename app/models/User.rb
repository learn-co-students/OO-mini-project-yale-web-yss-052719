class User

    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self

    end

    def self.all
        @@all
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(sell, recipe, date, rating)
    end

    def recipe_cards
        RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end
    end

    def recipes
        self.recipe_cards.map do |recipe_card|
            recipe_card.recipe
        end
    end

    def declare_allergy(ingredient)
        Allergy.new()
    end

    def allergens
        Allergy.all.select do |allergy|
            allergy.user == self
        end.map do |allergy|
            allergy.ingredient
        end
    end

    def top_three_recipes
        self.recipe_cards.sort_by do |recipecard|
            recipecard.rating
        end.reverse[0..2].map do |recipecard|
            recipecard.recipe
        end
    end

    def most_recent_recipe
        self.recipe_cards.all.sort_by do |recipecard|
            recipecard.date
        end.last.recipe
    end
    
#find all ingedients of each recipes --> then compare ingredient to allergic ingredients
    def safe_recipes
        arr = []
        recipes.each do |recipe|
            a = nil
            allergens.each do |ing|
                if recipe.ingredients.include?(ing) 
                    a = true
                    break
                end
            end
            if a == true
                next
            else
                arr << recipe
            end
        end
        arr.uniq
    end

    # smart way to do that
    def safe_recipes
        Recipe.all.select do |recipe|
            (self.allergens & recipe.ingredient).empty?
        end
    end

end
