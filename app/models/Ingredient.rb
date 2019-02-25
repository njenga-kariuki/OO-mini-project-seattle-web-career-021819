class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    counter_hash = {}
    Allergen.all.each do |allergen|
      counter_hash[allergen.ingredient] ||= 0
      counter_hash[allergen.ingredient] += 1
    end

    counter_hash.key(counter_hash.values.max)
  end

  def self.all
    @@all
  end
end
