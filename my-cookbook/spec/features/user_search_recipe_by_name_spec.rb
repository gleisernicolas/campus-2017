require 'rails_helper'

feature 'User search recipe by name' do
  scenario 'successfully' do
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos,
                          misture com o restante dos ingredientes')

    visit root_path

    fill_in 'Buscar receita', with: recipe.title
    click_on 'Buscar'

    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('p', text: recipe.recipe_type.name)
    expect(page).to have_css('p', text: recipe.cuisine.name)
  end

  scenario 'and find nothing' do
    visit root_path
    fill_in 'Buscar receita', with: 'Bolo de cenoura'
    click_on 'Buscar'

    expect(page). to have_content('Nehuma receita encontrada')
  end
end
