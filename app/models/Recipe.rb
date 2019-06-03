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
       RecipeIngredient.all.select do |recipe_ingredient|
        recipe_ingredient.recipe == self
       end.map do |ri|
           ri.ingredient
       end
   end


    def allergens
        arr = Allergy.all.map do |all|
            all.ingredient 
        end.uniq #all ingredients that cause allergy
        ingredients.select do |ing|
            arr.include?(ing)
        end

        # another method
        # self.ingredients.find_all do |ingredients|
        #     Allergy.all.find do |allergy|
        #         allergy.ingredient == ingredient
        #     end
        # end
    end

    end

    def add_ingredients(ingredients)
        ingredients.each do |ingredient|
            RecipeIngredient.new(ingredient, self)
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