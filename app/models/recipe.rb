class Recipe < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :complexity
  validates_presence_of :genre

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def total_cost
    ingredients.sum(:cost)
  end

  def self.alphabetical
    order(:name)
  end
end
