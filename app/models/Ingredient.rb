# noinspection RubyClassVariableUsageInspection
class Ingredient
  # User readers instead of explicit methods
  attr_reader :name

  @@all = []

  def initialize(name)
    @@all.append(self)

    @name = name
  end

  # return all of the ingredient instances
  def self.all
    @@all
  end

  # -- Brit solution --
  # def self.most_common_allergen
  #   Allergen.all.inject(Hash.new(0)) do |counts, item|
  #     counts[item.ingredient] += 1
  #   end.max_by {|key, val| val }.first
  # end

  # return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen
    # Use max_by to select the 'maximum' element as determined by a block
    @@all.max_by do |ingredient|
      # get all allergens which include this ingredient and return a count
      Allergen.all.select { |allergen| allergen.ingredient == ingredient }.count
    end
  end
end
