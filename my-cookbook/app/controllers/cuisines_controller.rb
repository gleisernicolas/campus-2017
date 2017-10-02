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

end
