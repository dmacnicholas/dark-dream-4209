require 'rails_helper'

RSpec.describe 'recipes index page' do

  it 'has a list of recipe names with complexity and genre' do
    pizza = Recipe.create!(name: "Pizza", complexity: 4, genre: "Italian")
    cheeseburger = Recipe.create!(name: "Cheeseburger", complexity: 3, genre: "American")
    burrito = Recipe.create!(name: "Burrito", complexity: 5, genre: "Mexican")

      visit "/recipes"

      within "#recipes-#{pizza.id}" do
      expect(page).to have_content("Name: Pizza")
      expect(page).to have_content("Complexity: 4")
      expect(page).to have_content("Genre: Italian")
    end

    within "#recipes-#{cheeseburger.id}" do
      expect(page).to have_content("Name: Cheeseburger")
      expect(page).to have_content("Complexity: 3")
      expect(page).to have_content("Genre: American")
    end

    within "#recipes-#{burrito.id}" do
      expect(page).to have_content("Name: Burrito")
      expect(page).to have_content("Complexity: 5")
      expect(page).to have_content("Genre: Mexican")
    end
  end
end
