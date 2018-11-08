
class Ingredient
  @@ingredients = []

  attr_reader :name

  def initialize(name)
    @@ingredients.append(self)

    @name = name
  end

  # return all of the ingredient instances
  def self.all
    @@ingredients
  end

  # return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen
    @@ingredients.max_by do |ingredient|
      Allergen.all.select do |allergen|
        allergen.ingredient == ingredient
      end.count
    end
  end
end
