
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

def self.most_common_allergen
    hash = {}
    Allergy.all.each do |allergy|
            if hash[allergy.ingredient] == nil
                hash[allergy.ingredient] = 1
            else
                hash[allergy.ingredient] += 1
            end
    end
    hash.max_by do |allergy, num|
        num
    end[0]
end

end