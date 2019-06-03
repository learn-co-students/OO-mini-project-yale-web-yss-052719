class RecipeCard

    attr_accessor :user, :recipe, :date, :rating
    @@all = []
   
    def initialize(user, recipe, date, rating)
      @user = user
      @recipe = recipe
      @date = date
      @rating = rating
      @@all << self
    end
   
    def self.all
      @@all
    end
end