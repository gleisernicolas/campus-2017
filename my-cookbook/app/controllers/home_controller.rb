class HomeController < ApplicationController
  def index
    @recipies = Recipe.all
    @cuisines = Cuisine.all
  end
end
