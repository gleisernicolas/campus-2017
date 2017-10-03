class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
        redirect_to recipe_url @recipe
    else
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      flash[:error] = 'Você deve informar todos os dados da receita'
      render :new
    end

    def use
      @recipe = Recipe.find(params[:id])
      @cuisines = Cuisine.all
      render :new
    end

  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cook_time,
                                   :cuisine_id, :ingredients,
                                   :method, :difficulty)

  end
end
