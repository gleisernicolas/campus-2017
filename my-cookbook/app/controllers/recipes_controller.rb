class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def show
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

  end

  def edit
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def update

    if @recipe.update(recipe_params)
      redirect_to recipe_url @recipe
    else
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      flash[:error] = 'Você deve informar todos os dados da receita'
      render :edit
    end
  end

  def destroy
    flash[:message] = 'Receita apagada com sucesso'
    @recipe.destroy
    redirect_to root_url
  end

  def search
    @recipes = Recipe.where(title: params[:title])
    if @recipes.empty?
      flash[:error] = 'Nehuma receita encontrada'
      redirect_to request.referer
    else
      render :results
    end
  end

  private
  def set_recipe
     @recipe = Recipe.find(params[:id])
   end

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cook_time,
                                   :cuisine_id, :ingredients,
                                   :method, :difficulty, :featured)

  end
end
