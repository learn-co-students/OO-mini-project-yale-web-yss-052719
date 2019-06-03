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
        ingr.ingredient
      end
    end
   
    def allergens
      user_allergies = Allergy.all.select do |users|
        users.user
      end
   
      arry = user_allergies.map do |ingr|
        ingr.ingredient
      end
    end
   
    def add_ingredients(ingredients)
      ingredients.each do |associate|
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