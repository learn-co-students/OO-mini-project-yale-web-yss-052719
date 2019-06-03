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
        RecipeCard.all.select do |recipecard|
            recipecard.recipe == self
        end.map do |recipe|
            recipe.user
        end
    end

    def ingredients
        RecipeIngredient.all.select do |ri|
            ri.recipe == self
        end.map do |ri1|
            ri1.ingredient
        end
    end


    def allergens
        arr = Allergy.all.map do |all|
            all.ingredient 
        end.uniq #all ingredients that cause allergy
        ingredients.select do |ing|
            arr.include?(ing)
        end
    end
            
    def add_ingredients(arr)
        arr.each do |ing|
            RecipeIngredient.new(ing, self)
        end
    end


    def self.most_popular
        hash = {}
        RecipeCard.all.each do |recipecard|
            if hash[recipecard.recipe] == nil
                hash[recipecard.recipe] = 1
            else
                hash[recipecard.recipe] += 1
            end
        end
        hash.max_by do |recipestring, num|
            num
        end[0]
    end

end