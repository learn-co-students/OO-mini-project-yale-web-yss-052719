class RecipeCard

    attr_reader :user, :recipe, :date, :rating

    @@all = []

    def initialize(user, recipe, date, rating)
        @user = user
        @recipe = recipe
        @date = date
        @rating = rating

        @@all << self
    end

    def rating
        @rating
    end

    def self.all
        @@all
    end
end