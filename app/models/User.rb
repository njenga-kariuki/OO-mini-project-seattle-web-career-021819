class User
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergens(ingredient)
    Allergen.new(self, ingredient)
  end

  def recipe_card
    RecipeCard.all.select do |card|
      card.user == self
    end
  end

  def most_recent_recipes
    self.recipe_card.max_by {|card| card.date}
  end

  def top_3_recipes
    self.recipe_card.max_by(3) {|card| card.rating}.map {|card| card.recipe}
  end

  def allergens
    Allergen.all.select{|allergen| allergen.user == self}.map {|allergen|allergen.ingredient}.uniq
  end

  def safe_recipes
     Recipe.all.select do |recipe|
      recipe.ingredients.none? do |ingredient|
        self.allergens.include?(ingredient)
      end
    end
  end

  def self.all
    @@all
  end
end
