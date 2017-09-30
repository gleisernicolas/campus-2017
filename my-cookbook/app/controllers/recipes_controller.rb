class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new
    recipe.title = params[:recipe][:title]
    recipe.recipe_type = params[:recipe][:recipe_type]
    recipe.cook_time = params[:recipe][:cook_time]
    recipe.method = params[:recipe][:method]
    recipe.ingredients = params[:recipe][:ingredients]
    recipe.cuisine = params[:recipe][:cuisine]
    recipe.difficulty = params[:recipe][:difficulty]

    recipe.save
    redirect_to recipe_path recipe
  end
end
