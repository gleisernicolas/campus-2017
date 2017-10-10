require 'rails_helper'

feature 'User see last recipes on index' do
  scenario 'successfully' do

    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    older_recipe = Recipe.create(title: 'Bolo de banana', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos,
                          misture com o restante dos ingredientes')

    newer_recipes = []
    6.times do |i|

      newer_recipes << Recipe.create(title: "Bolo de cenoura #{i}", recipe_type: recipe_type,
                            cuisine: cuisine, difficulty: 'Médio',
                            cook_time: 60,
                            ingredients: 'Farinha, açucar, cenoura',
                            method: 'Cozinhe a cenoura, corte em pedaços pequenos,
                            misture com o restante dos ingredientes')
    end




    visit root_path
    6.times do |i|
      expect(page).to have_css('h1', text: newer_recipes[i].title)
    end

    expect(page).not_to have_content(older_recipe.title)

  end
end
