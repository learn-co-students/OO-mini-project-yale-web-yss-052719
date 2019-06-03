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

    def recipes
        RecipeCard.all.select do |recipecard|
            recipecard.user == self
        end.map do |recipec|
            recipec.recipe
        end
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, date, rating, recipe)
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
        RecipeCard.all.sort_by do |recipecard|
            recipecard.rating
        end.reverse[0..2].map do |recipecard|
            recipecard.recipe
        end
    end

    def most_recent_recipe
        RecipeCard.all.sort_by do |recipecard|
            recipecard.date
        end[0].recipe
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


end