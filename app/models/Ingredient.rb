
class Ingredient

  attr_reader :name

  @@ingredients = []

  def initialize(name)
    @@ingredients.append(self)

    @name = name
  end

  # return all of the ingredient instances
  def self.all
    @@ingredients
  end

  # -- Brit solution --
  # def self.most_common_allergen
  #   Allergen.all.inject(Hash.new(0)) do |counts, item|
  #     counts[item.ingredient] += 1
  #   end.max_by {|key, val| val }.first
  # end

  # return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen
    @@ingredients.max_by do |ingredient|
      Allergen.all.select { |allergen| allergen.ingredient == ingredient }.count
    end
  end
end
