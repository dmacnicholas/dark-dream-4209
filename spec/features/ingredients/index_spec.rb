require 'rails_helper'

RSpec.describe 'ingredients index page' do

  it 'has a list of ingredients the number of recipes used in' do
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

    visit "/ingredients"

    within "#ingredients-#{cheese.id}" do
      expect(page).to have_content("Cheese: 2")
    end

    within "#ingredients-#{dough.id}" do
      expect(page).to have_content("Dough: 1")
    end

    within "#ingredients-#{marinara_sauce.id}" do
      expect(page).to have_content("Marinara Sauce: 1")
    end

    within "#ingredients-#{chicken.id}" do
      expect(page).to have_content("Chicken: 0")
    end

    within "#ingredients-#{bread.id}" do
      expect(page).to have_content("Bread: 1")
    end

    within "#ingredients-#{beef.id}" do
      expect(page).to have_content("Beef: 0")
    end

    within "#ingredients-#{rice.id}" do
      expect(page).to have_content("Rice: 1")
    end
  end
end
