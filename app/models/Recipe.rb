class Recipe

    # - `Recipe#allergens`
    # should return all of the `Ingredient`s in this recipe that are allergens for `User`s in our system.
    # - `Recipe#add_ingredients`
    # should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_popular
        @@all.max_by do |recipe|
            recipe.users.length
        end
    end

    def users
        RecipeCard.all.select do |recipecard|
            recipecard.recipe == self
        end.map do |recipecard|
            recipecard.user
        end
    end

    def ingredients
        RecipeIngredient.all.select do |recipeingredient|
            recipeingredient.recipe == self
        end.map do |recipeingredient|
            recipeingredient.ingredient
        end
    end

    def allergens
        self.ingredients.select do |ingredient|
            ingredient.users > 0 
        end
        ## return array of ingredients
        ## that meet condition, ingredients are allergens for users
    end

    def add_ingredients(array)
        array.each do |ingredient|
            RecipeIngredient.new(self,ingredient)
        end

        
        ## iterate over that array and
        ## create a new RecipeIngredient using ingredient + self
    end

end