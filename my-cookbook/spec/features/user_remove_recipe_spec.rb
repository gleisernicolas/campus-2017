require 'rails_helper'

feature 'User register and a remove recipe' do
  scenario 'successfully' do
    Cuisine.create(name: 'Arabe')
    RecipeType.create(name: 'Entrada')

    visit root_path
    click_on 'Enviar uma receita'

    fill_in 'Título', with: 'Tabule'
    select 'Arabe', from: 'Cozinha'
    select 'Entrada', from: 'Tipo da Receita'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '45'
    fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha'
    fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a gosto.'
    click_on 'Enviar'

    click_on 'Apagar Receita'
    # click_on 'Confirmar'

    expect(page).to have_content('Receita apagada com sucesso')
  end

end
