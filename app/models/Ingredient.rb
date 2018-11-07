
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

  end
end
