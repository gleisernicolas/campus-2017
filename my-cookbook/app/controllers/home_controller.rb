class HomeController < ApplicationController
  def index
    @last_six_recipes = Recipe.last(6)
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end
end
