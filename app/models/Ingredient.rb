class Ingredient

    @@all =[]
   
    attr_accessor :name
   
    def initialize(name)
      @name = name
   
      @@all << self
    end
   
    def self.all
      @@all
    end
   
    def users
      Allergy.all.select do |ingred|
        ingred.ingredient == self
      end.map do |user_|
        user_.user
      end
    end
   
    def self.most_common_allergen
      self.all.max_by do |order|
        order.users.size
      end
    end
   
    # users_allergies = Allergy.all.select do |ingred|
    #   ingred.ingredient
    # end
    #
    # freq = users_allergies.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    # users_allergies.max_by { |v| freq[v] }
    # end
end
