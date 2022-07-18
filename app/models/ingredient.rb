class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :cost

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def recipe_count
    recipes.count
  end

  def self.total_cost
    sum(:cost)
  end
end
