class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
        redirect_to recipe_url recipe
    else
      flash[:error] = 'Você deve informar todos os dados da receita'
      redirect_to new_recipe_url
    end

  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type, :cook_time, :cuisine_id, :ingredients, :method, :difficulty)

  end
end
