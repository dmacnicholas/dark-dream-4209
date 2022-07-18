class RecipesController < ApplicationController
  def index
    @recipes = Recipe.alphabetical
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

end
