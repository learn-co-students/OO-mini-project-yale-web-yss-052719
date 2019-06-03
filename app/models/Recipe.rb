class Recipe
    @@all = []
   
    attr_accessor :name, :recipe
   
    def initialize(name)
      @name = name
   
      @@all << self
    end
   
    def users
      RecipeCard.all.select do |recip|
        recip.recipe == self
      end
    end
   
    def ingredients
      RecipeIngredient.all.select do |ingr|
        ingr.recipe == self
      end.map do |ri|
        ri.ingredient
      end
    end
   
    def allergens
      self.ingredients.find_all do |ingredient|
        Allergy.all.find do |allergy|
          allergy.ingredient = ingredient
        end
      end
    end
   
    def add_ingredients(ingredients)
      ingredients.each do |associate|
        # For every ingredient, I need a recipe ingredient
        RecipeIngredient.new(self, associate)
      end
    end
   
   
    def self.all
      @@all
    end
   
    def self.most_popular
      recipe_arr = RecipeCard.all.select do |rec|
        rec.recipe
      end
   
      freq = recipe_arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      recipe_arr.max_by { |v| freq[v] }
   
    end
   end