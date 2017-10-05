require 'rails_helper'

feature 'Visitor edit recipe' do
  scenario 'successfully' do
    cuisine = Cuisine.create(name: 'Brasileira')
    other_cuisine = Cuisine.create(name: 'Mexicana')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, Açucar, Cenoura',
                          method: 'Cozinhe a cenoura')

    visit root_path
    click_on recipe.title
    click_on 'Editar'
    fill_in 'Título', with: 'Bolo de cenoura simples'
    fill_in 'Dificuldade', with: 'Fácil'
    select 'Mexicana', from: 'Cozinha'

    click_on 'Salvar'

    expect(page).to have_css('h1', text: 'Bolo de cenoura simples')
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: recipe.recipe_type.name)
    expect(page).to have_css('p', text: other_cuisine.name)
    expect(page).to have_css('p', text: 'Fácil')
    expect(page).to have_css('p', text: "#{recipe.cook_time} minutos")
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: recipe.ingredients)
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text: recipe.method)
  end

  scenario 'and must fill in all fields' do
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, Açucar, Cenoura',
                          method: 'Cozinhe a cenoura')


    visit edit_recipe_path recipe

    fill_in 'Título', with: ''
    fill_in 'Dificuldade', with: ''

    click_on 'Salvar'

    expect(page).to have_content('Você deve informar todos os dados da receita')

  end
end
