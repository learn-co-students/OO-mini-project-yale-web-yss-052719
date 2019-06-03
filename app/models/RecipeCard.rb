class RecipeCard
    attr_accessor :user, :date, :rating, :recipe
    @@all = []
    def initialize(user, date, rating, recipe)
        @user = user
        @date = date
        @rating = rating
        @recipe = recipe

        @@all << self
    end

    def self.all
        @@all
    end

end