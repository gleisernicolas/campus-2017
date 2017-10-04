class HomeController < ApplicationController
  def index
    @recipies = Recipe.all
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end
end
