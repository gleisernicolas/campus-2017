class CuisinesController < ApplicationController
  def new
    @cuisine = Cuisine.new
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def index
    @cuisine = Cuisine.all
  end

  def create
    @cuisine = Cuisine.new(params.require(:cuisine).permit(:name))

    if @cuisine.save
      redirect_to cuisine_url @cuisine
    else

      flash[:error]= 'Você deve informar o nome da cozinha'
      redirect_to new_cuisine_url
    end
  end

end
