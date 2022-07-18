require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  it 'shows the total cost of all the ingredients in the recipe' do
    pizza = Recipe.create!(name: "Pizza", complexity: 4, genre: "Italian")
    cheeseburger = Recipe.create!(name: "Cheeseburger", complexity: 3, genre: "American")
    burrito = Recipe.create!(name: "Burrito", complexity: 5, genre: "Mexican")

    cheese = Ingredient.create!(name: "Cheese", cost: 7)
    dough = Ingredient.create!(name: "Dough", cost: 5)
    marinara_sauce = Ingredient.create!(name: "Marinara Sauce", cost: 4)
    chicken = Ingredient.create!(name: "Chicken", cost: 10)
    bread = Ingredient.create!(name: "Bread", cost: 3)
    beef = Ingredient.create!(name: "Beef", cost: 12)
    rice = Ingredient.create!(name: "Rice", cost: 1)

    recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: pizza.id, ingredient_id: cheese.id)
    recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: pizza.id, ingredient_id: marinara_sauce.id)
    recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: pizza.id, ingredient_id: dough.id)
    recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: burrito.id, ingredient_id: rice.id)
    recipe_ingredient_5 = RecipeIngredient.create!(recipe_id: cheeseburger.id, ingredient_id: bread.id)

    expect(pizza.total_cost).to eq(16)
  end

  it 'sorts alphabetically' do
    cheese_pizza = Recipe.create!(name: "Cheese Pizza", complexity: 4, genre: "Italian")
    hamburger = Recipe.create!(name: "Hamburger", complexity: 3, genre: "American")
    quesadilla = Recipe.create!(name: "Quesadilla", complexity: 5, genre: "Mexican")

    expect(Recipe.alphabetical).to eq([cheese_pizza, hamburger, quesadilla])
  end

end
