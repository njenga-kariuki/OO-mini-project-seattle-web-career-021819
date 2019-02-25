require_relative '../config/environment.rb'

pizza = Recipe.new('pizza') # ['flour','sauce']
sandwich = Recipe.new('sandwich') # ['bread','meat']
soup = Recipe.new('soup') #['broth','veggies']

flour = Ingredient.new('flour')
sauce = Ingredient.new('sauce')
bread = Ingredient.new('bread')
meat = Ingredient.new('meat')
broth = Ingredient.new('broth')
veggies = Ingredient.new('veggies')

RecipeIngredient.new(pizza, flour)
RecipeIngredient.new(pizza, sauce)
RecipeIngredient.new(sandwich, bread)
RecipeIngredient.new(sandwich, meat)
RecipeIngredient.new(soup, broth)
RecipeIngredient.new(soup, veggies)

brian = User.new('Brian')
jay = User.new('Jay')
john = User.new('John')

#a1 = Allergen.new(brian, broth)
brian.declare_allergens(flour)
jay.declare_allergens(sauce)
john.declare_allergens(bread)
john.declare_allergens(broth)
jay.declare_allergens(broth)

rc1 = RecipeCard.new(brian,pizza,9,Date.new(2000, 10, 10))
rc2 = RecipeCard.new(jay,sandwich,8)
rc3 = RecipeCard.new(brian,soup,2, Date.new(2001, 1, 2))
rc4 = RecipeCard.new(brian,soup, 2, Date.new(2000, 1, 2))

binding.pry
0 #something after binding.pry
