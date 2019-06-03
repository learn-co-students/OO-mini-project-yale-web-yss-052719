class RecipeCard

    @@all = []
    attr_reader :user, :recipe, :date, :rating 
    # the order of the attr_reader doesn't matter
    # do not do another def date @date end because ruby will prioritise that one. should only have one type.

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