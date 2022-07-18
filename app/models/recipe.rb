class Recipe < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :complexity
  validates_presence_of :genre

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
