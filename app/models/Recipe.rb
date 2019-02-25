class Recipe
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_popular
    counter_hash = {}
    RecipeCard.all.each do |card|
      counter_hash[card.recipe] ||= 0
      counter_hash[card.recipe] +=1
    end
     counter_hash.key(counter_hash.values.max)
  end

  #returns cards for a recipe
  def recipe_cards
    RecipeCard.all.select do |card|
      card.recipe == self
    end
  end

  #return all users for a recipe
  def users
    self.recipe_cards.map do |card|
      card.user
    end
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def allergens
    recipes = RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end

    recipe_ingredients = recipes.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end

    Allergen.all.select do |allergen|
      recipe_ingredients.include?(allergen.ingredient)
    end
  end

  def self.all
    @@all
  end

end
