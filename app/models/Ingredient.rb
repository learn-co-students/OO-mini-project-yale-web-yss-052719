class Ingredient

    @@all = []

    def initialize

        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        @@all.max_by do |ingredient|
            ingredient.users.length
        end
    end

    def users
        Allergy.all.select do |allergy|
            allergy.ingredient == self
        end.map do |allergy|
            allergy.user
        end
    end

end
