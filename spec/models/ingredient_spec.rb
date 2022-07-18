require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  it 'lists the number of recipes each ingredient is used in' do
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
    recipe_ingredient_6 = RecipeIngredient.create!(recipe_id: cheeseburger.id, ingredient_id: cheese.id)

    expect(cheese.recipe_count).to eq(2)
    expect(dough.recipe_count).to eq(1)
    expect(beef.recipe_count).to eq(0)
  end

  it 'sorts alphabeticalically' do
    cheese = Ingredient.create!(name: "Cheese", cost: 7)
    dough = Ingredient.create!(name: "Dough", cost: 5)
    marinara_sauce = Ingredient.create!(name: "Marinara Sauce", cost: 4)
    chicken = Ingredient.create!(name: "Chicken", cost: 10)
    bread = Ingredient.create!(name: "Bread", cost: 3)
    beef = Ingredient.create!(name: "Beef", cost: 12)
    rice = Ingredient.create!(name: "Rice", cost: 1)

    expect(Ingredient.alphabetical.first).to eq(beef)
    expect(Ingredient.alphabetical.last).to eq(rice)
  end

end
