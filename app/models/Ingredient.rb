class Ingredient
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def allergen?
        Allergy.all.each do |allergy|
            if allergy.ingredient == self
                return true
            end
        end
        return false
    end

    def self.most_common_allergen
        hash = {}
        Allergy.all.each do |allergy|
            if !hash.keys.include?(allergy.ingredient)
                hash[allergy.ingredient] = 0
            end
            hash[allergy.ingredient] += 1
        end
        hash.key(hash.values.max)
    end
end
