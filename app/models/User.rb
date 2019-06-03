class User

    # - `User#top_three_recipes`
    # should return the top three highest rated recipes for this user.
    # - `User#most_recent_recipe`
    # should return the recipe most recently added to the user's cookbook.

    @@all = []

    def initialize

        @@all << self
    end

    def self.all
        @@all
    end

    def recipes
        RecipeCard.all.select do |recipecard|
            recipecard.user == self
        end.map do |recipecard|
            recipecard.recipe
        end
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
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
        array = RecipeCard.all.select do |recipecard|
            recipecard.user == self 
        end
        sorted_array = array.sort_by do |recipecard| 
            recipecard.rating 
        end.reverse 
        recipes = sorted_array.map do |recipecard| 
            recipecard.recipe
        end

        recipes[0..2]
    
        ## recipecard ==> recipe
        ## create array to sort recipes
        ## create array to pick top 3 
        ## create array to convert recipecards to recipes

    end

    def most_recent_recipe
        recipecard = RecipeCard.all.min_by do |recipecard|
            recipecard.date 
        end
        recipecard.recipe
    end

end