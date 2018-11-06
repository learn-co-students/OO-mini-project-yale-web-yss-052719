
class Ingredient
  @@ingredients = []

  def initialize
    @@ingredients << self
  end

  # return all of the ingredient instances
  def self.all
    return @@ingredients
  end

  # return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen

  end
end
