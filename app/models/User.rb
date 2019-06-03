class User

    @@all = []
   
    attr_accessor :name, :recipe
   
    def initialize(name)
      @name = name
   
      @@all << self
    end
   
    def self.all
      @@all
    end
   
    def recipe_cards
      RecipeCard.all.select do |user_|
        user_.user == self
      end
    end
    
    def recipes
      self.recipe_cards.map do |recipe_|
        recipe_.recipe
      end
    end
   
    def add_recipe_card(recipe, date, rating)
      new_recipe = RecipeCard.new(self, recipe, date, rating)
      # new_recipe.user == self
    end
   
    def declare_allergy(ingredient)
      Allergy.new(self, ingredient)
    end
   
    def allergens
      Allergy.all.select do |use|
        use.user == self
      end.map do |ingr|
        ingr.ingredient
      end
    end
   
    def top_three_recipes
      rating_arr = RecipeCard.all.select do |user_|
        user_.user == self
      end.sort_by do |top|
        top.rating
      end
   
      rating_arr.map do |thr|
        thr.recipe
      end.last(3).reverse #Instead of last(3), use [0..2]

      # ....
      # top.rating
      # end.reverse[0..2].map {|recipe_card| recipe_card.recipe}
    end
   
    def most_recent_recipe
      RecipeCard.all.sort_by do |date_|
        date_.date
      end.last.recipe
    end
end